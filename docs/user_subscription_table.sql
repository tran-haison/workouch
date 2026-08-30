-- ============================================================================
-- User Subscription Table for Supabase
-- ============================================================================
-- Creates the public.user_subscription table to track user subscription tiers,
-- workout generation limits, and usage within billing periods.
-- ============================================================================

-- ============================================================================
-- Table: public.user_subscription
-- ============================================================================
-- Tracks user subscription information including tier, workout generation limits,
-- and usage within the current billing period.
-- ============================================================================

CREATE TABLE IF NOT EXISTS public.user_subscription (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  subscription_tier TEXT NOT NULL DEFAULT 'basic' CHECK (subscription_tier IN ('basic', 'proMonthly', 'proYearly', 'proLifetime')),
  workout_gen_limit INTEGER NOT NULL DEFAULT 1 CHECK (workout_gen_limit IN (1, 50)),
  workout_gen_used INTEGER NOT NULL DEFAULT 0 CHECK (workout_gen_used >= 0),
  period_start TIMESTAMPTZ NOT NULL DEFAULT timezone('utc', now()),
  period_end TIMESTAMPTZ NOT NULL DEFAULT timezone('utc', now()) + INTERVAL '30 days',
  created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc', now()),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc', now()),
  UNIQUE(user_id)
);

CREATE INDEX IF NOT EXISTS idx_user_subscription_user_id 
  ON public.user_subscription(user_id);

-- ============================================================================
-- Row-Level Security Policies
-- ============================================================================

ALTER TABLE public.user_subscription ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist (for idempotency)
DROP POLICY IF EXISTS "Users can view their own subscription" ON public.user_subscription;
DROP POLICY IF EXISTS "Users can update their own subscription" ON public.user_subscription;

-- Create RLS policies
CREATE POLICY "Users can view their own subscription"
  ON public.user_subscription FOR SELECT
  TO authenticated
  USING ((SELECT auth.uid()) = user_id);

REVOKE ALL ON TABLE public.user_subscription FROM anon, authenticated;
GRANT SELECT ON TABLE public.user_subscription TO authenticated;

-- ============================================================================
-- Function: update_user_subscription_updated_at()
-- ============================================================================
-- Keeps updated_at in sync whenever a subscription record changes.
-- ============================================================================

CREATE OR REPLACE FUNCTION public.update_user_subscription_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = timezone('utc', now());
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS update_user_subscription_updated_at 
  ON public.user_subscription;

CREATE TRIGGER update_user_subscription_updated_at
  BEFORE UPDATE ON public.user_subscription
  FOR EACH ROW
  EXECUTE FUNCTION public.update_user_subscription_updated_at();

-- ============================================================================
-- Function: create_user_subscription_for_new_user()
-- ============================================================================
-- Automatically creates a subscription record when a new user is created.
-- Sets default to basic tier with 1 workout generation limit.
-- ============================================================================

CREATE OR REPLACE FUNCTION public.create_user_subscription_for_new_user()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = pg_catalog, public
AS $$
DECLARE
  period_start_date TIMESTAMPTZ;
  period_end_date TIMESTAMPTZ;
BEGIN
  period_start_date := timezone('utc', now());
  period_end_date := period_start_date + INTERVAL '30 days';
  
  INSERT INTO public.user_subscription (
    user_id,
    period_start,
    period_end
  )
  VALUES (
    NEW.id,
    period_start_date,
    period_end_date
  )
  ON CONFLICT (user_id) DO NOTHING;
  
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS on_user_created_subscription ON auth.users;

CREATE TRIGGER on_user_created_subscription
  AFTER INSERT ON auth.users
  FOR EACH ROW
  EXECUTE FUNCTION public.create_user_subscription_for_new_user();

-- ============================================================================
-- Notes
-- ============================================================================
-- 1. Script is idempotent—safe to re-run.
-- 2. Drops old workout_generations_limit table if it exists.
-- 3. Auto-creates subscription record when new user is created via auth.users trigger.
-- 4. Entitlements, limits, usage, and period resets are server-managed. Apply
--    the public-release hardening migration before deploying the app.
-- 5. Limit values:
--    - Basic tier: 1 generation per 30-day period
--    - Pro tier (Monthly/Yearly/Lifetime): 50 generations per 30-day period
-- 6. The period_end is set to 30 days from period_start by default.
-- ============================================================================
