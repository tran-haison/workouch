-- ============================================================================
-- Users Table & Trigger for Supabase
-- ============================================================================
-- Creates the public.users profile table, RLS policies, and trigger that
-- automatically inserts/updates rows whenever auth.users receives a new record
-- (Google, Apple, email/password, etc.).
-- ============================================================================

-- ============================================================================
-- Table: public.users
-- ============================================================================
-- Stores application-specific profile data linked 1:1 with auth.users.
-- ============================================================================

CREATE TABLE IF NOT EXISTS public.users (
  id UUID PRIMARY KEY REFERENCES auth.users (id) ON DELETE CASCADE,
  email TEXT NOT NULL DEFAULT '',
  full_name TEXT NOT NULL DEFAULT '',
  avatar_url TEXT NOT NULL DEFAULT '',
  gender TEXT NOT NULL DEFAULT 'male' CHECK (gender IN ('male', 'female')),
  age INTEGER NOT NULL DEFAULT 0 CHECK (age >= 0),
  height DOUBLE PRECISION NOT NULL DEFAULT 0 CHECK (height >= 0), -- centimeters
  weight DOUBLE PRECISION NOT NULL DEFAULT 0 CHECK (weight >= 0), -- kilograms
  measurement_system TEXT NOT NULL DEFAULT 'metric' CHECK (measurement_system IN ('metric', 'imperial')),
  activity_level TEXT NOT NULL DEFAULT 'sedentary' CHECK (activity_level IN ('sedentary', 'lightlyActive', 'moderatelyActive', 'veryActive', 'extremelyActive')),
  subscription_tier TEXT NOT NULL DEFAULT 'basic' CHECK (subscription_tier IN ('basic', 'proMonthly', 'proYearly', 'proLifetime')),
  has_onboard BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc', now()),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT timezone('utc', now())
);

CREATE INDEX IF NOT EXISTS idx_users_email ON public.users (email);

-- ============================================================================
-- Row-Level Security Policies
-- ============================================================================

ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist (for idempotency)
DROP POLICY IF EXISTS "Users can view their own profile" ON public.users;
DROP POLICY IF EXISTS "Users can update their own profile" ON public.users;

-- Create RLS policies
CREATE POLICY "Users can view their own profile"
  ON public.users FOR SELECT
  TO authenticated
  USING ((SELECT auth.uid()) = id);

CREATE POLICY "Users can update their own profile"
  ON public.users FOR UPDATE
  TO authenticated
  USING ((SELECT auth.uid()) = id)
  WITH CHECK ((SELECT auth.uid()) = id);

REVOKE ALL ON TABLE public.users FROM anon, authenticated;
GRANT SELECT ON TABLE public.users TO authenticated;
GRANT UPDATE (
  age, gender, height, weight, measurement_system, activity_level, has_onboard
) ON TABLE public.users TO authenticated;

-- ============================================================================
-- Function: update_users_updated_at()
-- ============================================================================
-- Keeps updated_at in sync whenever a profile row changes.
-- ============================================================================

CREATE OR REPLACE FUNCTION public.update_users_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = timezone('utc', now());
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS update_users_updated_at ON public.users;
CREATE TRIGGER update_users_updated_at
  BEFORE UPDATE ON public.users
  FOR EACH ROW
  EXECUTE FUNCTION public.update_users_updated_at();

-- ============================================================================
-- Trigger Function: handle_new_auth_user()
-- ============================================================================
-- Ensures every auth signup automatically gets/updates a profile row.
-- ============================================================================

CREATE OR REPLACE FUNCTION public.handle_new_auth_user()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = pg_catalog, public
AS $$
BEGIN
  INSERT INTO public.users (id, email, full_name, avatar_url)
  VALUES (
    NEW.id,
    NEW.email,
    COALESCE(NEW.raw_user_meta_data->>'full_name', ''),
    COALESCE(NEW.raw_user_meta_data->>'avatar_url', '')
  )
  ON CONFLICT (id) DO UPDATE
    SET email = EXCLUDED.email,
        full_name = COALESCE(EXCLUDED.full_name, ''),
        avatar_url = COALESCE(EXCLUDED.avatar_url, ''),
        updated_at = timezone('utc', now());

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;

CREATE TRIGGER on_auth_user_created
AFTER INSERT ON auth.users
FOR EACH ROW
EXECUTE FUNCTION public.handle_new_auth_user();

-- ============================================================================
-- Notes
-- ============================================================================
-- 1. Script is idempotent—safe to re-run.
-- 2. Covers all providers routed through auth.users (Google, Apple, email).
-- 3. Extend the table with additional profile data as needed.
-- ============================================================================
