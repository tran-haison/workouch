-- ============================================================================
-- Workout History Database Schema for Supabase
-- ============================================================================
-- This script creates the database schema for workout history including:
-- - workout_sessions table (completed workout records)
-- - workout_session_exercises table (exercises performed in each session)
-- - exercise_personal_records table (PRs for display on History tab)
-- - user_workout_weeks table (week streak - weeks with at least 1 completed workout)
-- - get_week_streak(p_user_id) function for streak calculation
-- - Indexes
-- - RLS Policies
-- - Triggers for automatic timestamp updates
--
-- Prerequisites: workout_database_schema.sql must be run first (workouts table,
-- auth.users). The update_updated_at_column() function is created there.
-- ============================================================================

-- ============================================================================
-- Table 1: workout_sessions
-- ============================================================================
-- Stores records of completed workout sessions.
-- One row per finished workout.
-- ============================================================================

CREATE TABLE IF NOT EXISTS workout_sessions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  workout_id UUID REFERENCES workouts(id) ON DELETE SET NULL, -- nullable for ad-hoc workouts
  workout_name TEXT NOT NULL, -- snapshot of workout name at completion
  started_at TIMESTAMPTZ NOT NULL,
  completed_at TIMESTAMPTZ NOT NULL,
  total_duration_seconds INTEGER NOT NULL DEFAULT 0 CHECK (total_duration_seconds >= 0),
  total_volume_kg DECIMAL(12, 2) NOT NULL DEFAULT 0 CHECK (total_volume_kg >= 0),
  total_sets INTEGER NOT NULL DEFAULT 0 CHECK (total_sets >= 0),
  total_exercises INTEGER NOT NULL DEFAULT 0 CHECK (total_exercises >= 0),
  calories_burned DECIMAL(10, 2), -- nullable, computed from TDEE/activity if available
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Indexes for workout_sessions table
CREATE INDEX IF NOT EXISTS idx_workout_sessions_user_id ON workout_sessions(user_id);
CREATE INDEX IF NOT EXISTS idx_workout_sessions_completed_at ON workout_sessions(completed_at);
CREATE INDEX IF NOT EXISTS idx_workout_sessions_user_completed_at ON workout_sessions(user_id, completed_at DESC);

-- RLS Policies for workout_sessions table
ALTER TABLE workout_sessions ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view their own workout sessions" ON workout_sessions;
DROP POLICY IF EXISTS "Users can create their own workout sessions" ON workout_sessions;
DROP POLICY IF EXISTS "Users can update their own workout sessions" ON workout_sessions;
DROP POLICY IF EXISTS "Users can delete their own workout sessions" ON workout_sessions;

CREATE POLICY "Users can view their own workout sessions"
  ON workout_sessions FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can create their own workout sessions"
  ON workout_sessions FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own workout sessions"
  ON workout_sessions FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own workout sessions"
  ON workout_sessions FOR DELETE
  USING (auth.uid() = user_id);

-- ============================================================================
-- Table 2: workout_session_exercises
-- ============================================================================
-- Stores exercises performed within each workout session.
-- Sets stored as JSONB (same structure as workout_exercises).
-- ============================================================================

CREATE TABLE IF NOT EXISTS workout_session_exercises (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  workout_session_id UUID NOT NULL REFERENCES workout_sessions(id) ON DELETE CASCADE,
  exercise_order INTEGER NOT NULL CHECK (exercise_order >= 0),
  exercise_id TEXT NOT NULL,
  name TEXT NOT NULL,
  gif_url TEXT NOT NULL DEFAULT '',
  set_type TEXT NOT NULL CHECK (set_type IN ('weightBased', 'timeBased', 'distanceBased', 'repsOnly')),
  sets JSONB NOT NULL DEFAULT '[]'::jsonb,
  -- Same structure as workout_exercises.sets:
  -- [
  --   { "type": "weightBased", "sets": 3, "reps": 10, "weight": 50.0, "duration": 0, "distance": 0.0 },
  --   { "type": "timeBased", "sets": 0, "reps": 0, "weight": 0.0, "duration": 90, "distance": 0.0 }
  -- ]
  rest_time_between_sets INTEGER NOT NULL DEFAULT 0 CHECK (rest_time_between_sets >= 0),
  total_volume_kg DECIMAL(12, 2) NOT NULL DEFAULT 0 CHECK (total_volume_kg >= 0),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CONSTRAINT workout_session_exercises_order_unique UNIQUE (workout_session_id, exercise_order)
);

-- Indexes for workout_session_exercises table
CREATE INDEX IF NOT EXISTS idx_workout_session_exercises_session_id ON workout_session_exercises(workout_session_id);
CREATE INDEX IF NOT EXISTS idx_workout_session_exercises_order ON workout_session_exercises(workout_session_id, exercise_order);

-- RLS Policies for workout_session_exercises table
ALTER TABLE workout_session_exercises ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can manage exercises in their workout sessions" ON workout_session_exercises;

CREATE POLICY "Users can manage exercises in their workout sessions"
  ON workout_session_exercises FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM workout_sessions
      WHERE workout_sessions.id = workout_session_exercises.workout_session_id
      AND workout_sessions.user_id = auth.uid()
    )
  )
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM workout_sessions
      WHERE workout_sessions.id = workout_session_exercises.workout_session_id
      AND workout_sessions.user_id = auth.uid()
    )
  );

-- ============================================================================
-- Table 3: exercise_personal_records
-- ============================================================================
-- Stores personal records per exercise for display on History tab.
-- ============================================================================

CREATE TABLE IF NOT EXISTS exercise_personal_records (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  exercise_id TEXT NOT NULL,
  name TEXT NOT NULL, -- snapshot for display
  gif_url TEXT NOT NULL DEFAULT '',
  max_reps INTEGER NOT NULL DEFAULT 0 CHECK (max_reps >= 0),
  max_weight_kg DECIMAL(10, 2) NOT NULL DEFAULT 0 CHECK (max_weight_kg >= 0),
  max_duration_seconds INTEGER NOT NULL DEFAULT 0 CHECK (max_duration_seconds >= 0),
  max_distance_meters DECIMAL(12, 2) NOT NULL DEFAULT 0 CHECK (max_distance_meters >= 0),
  set_type TEXT NOT NULL CHECK (set_type IN ('weightBased', 'timeBased', 'distanceBased', 'repsOnly')),
  pr_date DATE NOT NULL,
  is_visible_on_history BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CONSTRAINT exercise_personal_records_user_exercise_unique UNIQUE (user_id, exercise_id)
);

-- Indexes for exercise_personal_records table
CREATE INDEX IF NOT EXISTS idx_exercise_pr_user_id ON exercise_personal_records(user_id);
CREATE INDEX IF NOT EXISTS idx_exercise_pr_user_date ON exercise_personal_records(user_id, pr_date DESC);
CREATE INDEX IF NOT EXISTS idx_exercise_pr_user_visible ON exercise_personal_records(user_id, is_visible_on_history) WHERE is_visible_on_history = true;

-- RLS Policies for exercise_personal_records table
ALTER TABLE exercise_personal_records ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view their own exercise PRs" ON exercise_personal_records;
DROP POLICY IF EXISTS "Users can create their own exercise PRs" ON exercise_personal_records;
DROP POLICY IF EXISTS "Users can update their own exercise PRs" ON exercise_personal_records;
DROP POLICY IF EXISTS "Users can delete their own exercise PRs" ON exercise_personal_records;

CREATE POLICY "Users can view their own exercise PRs"
  ON exercise_personal_records FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can create their own exercise PRs"
  ON exercise_personal_records FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own exercise PRs"
  ON exercise_personal_records FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own exercise PRs"
  ON exercise_personal_records FOR DELETE
  USING (auth.uid() = user_id);

-- Trigger to automatically update updated_at on exercise_personal_records
DROP TRIGGER IF EXISTS update_exercise_personal_records_updated_at ON exercise_personal_records;
CREATE TRIGGER update_exercise_personal_records_updated_at
  BEFORE UPDATE ON exercise_personal_records
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- ============================================================================
-- Table 4: user_workout_weeks
-- ============================================================================
-- Stores weeks where the user completed at least 1 workout.
-- Used for week streak calculation (consecutive weeks with workouts).
-- week_start_date = Monday of the week (ISO week start).
-- Upsert on workout completion; delete/decrement on workout deletion.
-- ============================================================================

CREATE TABLE IF NOT EXISTS user_workout_weeks (
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  week_start_date DATE NOT NULL, -- Monday of the week
  workout_count INTEGER NOT NULL DEFAULT 1 CHECK (workout_count > 0),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  PRIMARY KEY (user_id, week_start_date)
);

-- Index for user_workout_weeks (streak query: order by week_start_date DESC)
CREATE INDEX IF NOT EXISTS idx_user_workout_weeks_user_week ON user_workout_weeks(user_id, week_start_date DESC);

-- RLS Policies for user_workout_weeks table
ALTER TABLE user_workout_weeks ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view their own workout weeks" ON user_workout_weeks;
DROP POLICY IF EXISTS "Users can create their own workout weeks" ON user_workout_weeks;
DROP POLICY IF EXISTS "Users can update their own workout weeks" ON user_workout_weeks;
DROP POLICY IF EXISTS "Users can delete their own workout weeks" ON user_workout_weeks;

CREATE POLICY "Users can view their own workout weeks"
  ON user_workout_weeks FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can create their own workout weeks"
  ON user_workout_weeks FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own workout weeks"
  ON user_workout_weeks FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own workout weeks"
  ON user_workout_weeks FOR DELETE
  USING (auth.uid() = user_id);

-- ============================================================================
-- Function: get_week_streak
-- ============================================================================
-- Returns the number of consecutive weeks (going backwards from the most recent)
-- where the user completed at least 1 workout. Used via Supabase RPC.
-- ============================================================================

CREATE OR REPLACE FUNCTION get_week_streak(p_user_id UUID)
RETURNS INTEGER AS $$
  WITH RECURSIVE most_recent_week AS (
    SELECT week_start_date
    FROM user_workout_weeks
    WHERE user_id = p_user_id
    ORDER BY week_start_date DESC
    LIMIT 1
  ),
  streak_walk AS (
    SELECT week_start_date, 1 AS streak
    FROM most_recent_week

    UNION ALL

    SELECT uww.week_start_date, sw.streak + 1
    FROM streak_walk sw
    JOIN user_workout_weeks uww
      ON uww.user_id = p_user_id
     AND uww.week_start_date = sw.week_start_date - INTERVAL '7 days'
  )
  SELECT COALESCE(MAX(streak), 0)::INTEGER
  FROM streak_walk;
$$ LANGUAGE SQL STABLE;

-- ============================================================================
-- Verification Queries (Optional - for testing)
-- ============================================================================

-- Verify tables exist
-- SELECT table_name FROM information_schema.tables
-- WHERE table_schema = 'public'
-- AND table_name IN ('workout_sessions', 'workout_session_exercises', 'exercise_personal_records', 'user_workout_weeks');

-- ============================================================================
-- Notes:
-- ============================================================================
-- 1. Run workout_database_schema.sql first (creates workouts table and update_updated_at_column function)
-- 2. This script is idempotent - it can be run multiple times safely
-- 3. To disable RLS for testing:
--    ALTER TABLE workout_sessions DISABLE ROW LEVEL SECURITY;
--    ALTER TABLE workout_session_exercises DISABLE ROW LEVEL SECURITY;
--    ALTER TABLE exercise_personal_records DISABLE ROW LEVEL SECURITY;
--    ALTER TABLE user_workout_weeks DISABLE ROW LEVEL SECURITY;
-- 4. workout_id in workout_sessions is nullable - use NULL for ad-hoc workouts not from a template
-- 5. exercise_personal_records is independent of workout_sessions/workout_session_exercises (no FKs)
-- 6. user_workout_weeks: upsert on workout_sessions insert; decrement/delete on workout_sessions delete
-- ============================================================================
