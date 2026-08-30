-- Public-release hardening for profiles, subscriptions, and workout data.
-- Apply after the schema scripts that originally created these tables.

REVOKE CREATE ON SCHEMA public FROM PUBLIC;
GRANT USAGE ON SCHEMA public TO anon, authenticated;

-- Subscription and entitlement fields are server-managed. Authenticated users
-- may read their own values, but only the service role may change them.
DROP POLICY IF EXISTS "Users can update their own subscription"
  ON public.user_subscription;
DROP POLICY IF EXISTS "Users can view their own subscription"
  ON public.user_subscription;
CREATE POLICY "Users can view their own subscription"
  ON public.user_subscription
  FOR SELECT
  TO authenticated
  USING ((SELECT auth.uid()) = user_id);

REVOKE ALL ON TABLE public.user_subscription FROM anon, authenticated;
GRANT SELECT ON TABLE public.user_subscription TO authenticated;

-- Profiles remain user-editable, but billing fields and identity metadata do
-- not. Column grants are required in addition to RLS because RLS cannot protect
-- individual columns.
DROP POLICY IF EXISTS "Users can view their own profile" ON public.users;
DROP POLICY IF EXISTS "Users can update their own profile" ON public.users;
CREATE POLICY "Users can view their own profile"
  ON public.users
  FOR SELECT
  TO authenticated
  USING ((SELECT auth.uid()) = id);
CREATE POLICY "Users can update their own profile"
  ON public.users
  FOR UPDATE
  TO authenticated
  USING ((SELECT auth.uid()) = id)
  WITH CHECK ((SELECT auth.uid()) = id);

REVOKE ALL ON TABLE public.users FROM anon, authenticated;
GRANT SELECT ON TABLE public.users TO authenticated;
GRANT UPDATE (
  age,
  gender,
  height,
  weight,
  measurement_system,
  activity_level,
  has_onboard
) ON TABLE public.users TO authenticated;

-- Explicit Data API grants for the remaining user-owned tables. This works with
-- Supabase's new default where newly-created public tables are not auto-exposed.
REVOKE ALL ON TABLE public.workouts FROM anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE public.workouts TO authenticated;

REVOKE ALL ON TABLE public.workout_exercises FROM anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE public.workout_exercises TO authenticated;

REVOKE ALL ON TABLE public.workout_sessions FROM anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE public.workout_sessions TO authenticated;

REVOKE ALL ON TABLE public.workout_session_exercises FROM anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE public.workout_session_exercises TO authenticated;

REVOKE ALL ON TABLE public.exercise_personal_records FROM anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE public.exercise_personal_records TO authenticated;

REVOKE ALL ON TABLE public.user_workout_weeks FROM anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE public.user_workout_weeks TO authenticated;

-- Prevent inserting a child exercise into another user's workout. The old ALL
-- policy had no WITH CHECK clause, which left INSERT validation ambiguous.
DROP POLICY IF EXISTS "Users can manage exercises in their workouts"
  ON public.workout_exercises;
CREATE POLICY "Users can manage exercises in their workouts"
  ON public.workout_exercises
  FOR ALL
  TO authenticated
  USING (
    EXISTS (
      SELECT 1
      FROM public.workouts
      WHERE workouts.id = workout_exercises.workout_id
        AND workouts.user_id = (SELECT auth.uid())
    )
  )
  WITH CHECK (
    EXISTS (
      SELECT 1
      FROM public.workouts
      WHERE workouts.id = workout_exercises.workout_id
        AND workouts.user_id = (SELECT auth.uid())
    )
  );

-- Atomically reserve one generation before the upstream AI request. The
-- function is reachable only by Edge Functions using the service role.
CREATE OR REPLACE FUNCTION public.reserve_workout_generation(p_user_id uuid)
RETURNS public.user_subscription
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = pg_catalog, public
AS $$
DECLARE
  subscription public.user_subscription;
  current_time timestamptz := timezone('utc', now());
BEGIN
  SELECT *
  INTO subscription
  FROM public.user_subscription
  WHERE user_id = p_user_id
  FOR UPDATE;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'subscription_not_found' USING ERRCODE = 'P0001';
  END IF;

  IF current_time >= subscription.period_end THEN
    UPDATE public.user_subscription
    SET workout_gen_used = 0,
        period_start = current_time,
        period_end = current_time + interval '30 days'
    WHERE user_id = p_user_id
    RETURNING * INTO subscription;
  END IF;

  IF subscription.workout_gen_used >= subscription.workout_gen_limit THEN
    RAISE EXCEPTION 'workout_generation_limit_reached' USING ERRCODE = 'P0001';
  END IF;

  UPDATE public.user_subscription
  SET workout_gen_used = workout_gen_used + 1
  WHERE user_id = p_user_id
  RETURNING * INTO subscription;

  RETURN subscription;
END;
$$;

CREATE OR REPLACE FUNCTION public.refund_workout_generation(p_user_id uuid)
RETURNS void
LANGUAGE sql
SECURITY DEFINER
SET search_path = pg_catalog, public
AS $$
  UPDATE public.user_subscription
  SET workout_gen_used = GREATEST(workout_gen_used - 1, 0)
  WHERE user_id = p_user_id;
$$;

REVOKE ALL ON FUNCTION public.reserve_workout_generation(uuid)
  FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.refund_workout_generation(uuid)
  FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.reserve_workout_generation(uuid)
  TO service_role;
GRANT EXECUTE ON FUNCTION public.refund_workout_generation(uuid)
  TO service_role;

-- Trigger functions and RPCs should not be directly executable by API users.
REVOKE ALL ON FUNCTION public.handle_new_auth_user() FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.create_user_subscription_for_new_user() FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.update_users_updated_at() FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.update_user_subscription_updated_at() FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.update_updated_at_column() FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.get_week_streak(uuid) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.get_week_streak(uuid) TO authenticated;

ALTER FUNCTION public.handle_new_auth_user()
  SET search_path = pg_catalog, public;
ALTER FUNCTION public.create_user_subscription_for_new_user()
  SET search_path = pg_catalog, public;
