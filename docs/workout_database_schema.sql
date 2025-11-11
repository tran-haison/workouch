-- ============================================================================
-- Workout Database Schema for Supabase
-- ============================================================================
-- This script creates the complete database schema for workouts including:
-- - Function to automatically update updated_at column
-- - workouts table
-- - workout_exercises table
-- - Indexes
-- - RLS Policies
-- - Triggers for automatic timestamp updates
-- ============================================================================

-- ============================================================================
-- Function: update_updated_at_column()
-- ============================================================================
-- Reusable function to automatically update the updated_at column to the 
-- current timestamp when a row is updated.
-- ============================================================================

CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- Table 1: workouts
-- ============================================================================
-- Main table for storing workout templates.
-- ============================================================================

CREATE TABLE IF NOT EXISTS workouts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  rest_time_between_exercises INTEGER NOT NULL DEFAULT 0 CHECK (rest_time_between_exercises >= 0), -- in seconds
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Indexes for workouts table
CREATE INDEX IF NOT EXISTS idx_workouts_user_id ON workouts(user_id);

-- RLS Policies for workouts table
ALTER TABLE workouts ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist (for idempotency)
DROP POLICY IF EXISTS "Users can view their own workouts" ON workouts;
DROP POLICY IF EXISTS "Users can create their own workouts" ON workouts;
DROP POLICY IF EXISTS "Users can update their own workouts" ON workouts;
DROP POLICY IF EXISTS "Users can delete their own workouts" ON workouts;

-- Create RLS Policies
CREATE POLICY "Users can view their own workouts"
  ON workouts FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can create their own workouts"
  ON workouts FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own workouts"
  ON workouts FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own workouts"
  ON workouts FOR DELETE
  USING (auth.uid() = user_id);

-- Trigger to automatically update updated_at on workouts
DROP TRIGGER IF EXISTS update_workouts_updated_at ON workouts;
CREATE TRIGGER update_workouts_updated_at
  BEFORE UPDATE ON workouts
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- ============================================================================
-- Table 2: workout_exercises
-- ============================================================================
-- Stores exercises within workouts with snapshot data, settings, and sets.
-- Sets are stored as JSONB array for flexibility.
-- ============================================================================

CREATE TABLE IF NOT EXISTS workout_exercises (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  workout_id UUID NOT NULL REFERENCES workouts(id) ON DELETE CASCADE,
  exercise_order INTEGER NOT NULL CHECK (exercise_order >= 0), -- order of exercise in workout (0, 1, 2, ...)
  
  -- Exercise snapshot (from external API)
  exercise_id TEXT NOT NULL, -- reference to external exercise API
  name TEXT NOT NULL,
  gif_url TEXT NOT NULL,
  description TEXT NOT NULL,
  target_muscles TEXT[] NOT NULL DEFAULT '{}', -- array of strings
  body_parts TEXT[] NOT NULL DEFAULT '{}',
  equipments TEXT[] NOT NULL DEFAULT '{}',
  secondary_muscles TEXT[] NOT NULL DEFAULT '{}',
  instructions TEXT[] NOT NULL DEFAULT '{}',
  
  -- Exercise-specific settings
  rest_time_between_sets INTEGER NOT NULL DEFAULT 0 CHECK (rest_time_between_sets >= 0), -- in seconds
  set_type TEXT CHECK (set_type IN ('weightBased', 'timeBased', 'distanceBased', 'repsOnly') OR set_type IS NULL), -- 'weightBased', 'timeBased', 'distanceBased', 'repsOnly'
  
  -- Sets stored as JSONB array (List<WorkingSetDto>)
  sets JSONB NOT NULL DEFAULT '[]'::jsonb,
  -- Example structure:
  -- [
  --   {
  --     "type": "weightBased",
  --     "sets": 3,
  --     "reps": 10,
  --     "weight": 50.0,
  --     "duration": 0,
  --     "distance": 0.0
  --   },
  --   {
  --     "type": "timeBased",
  --     "sets": 0,
  --     "reps": 0,
  --     "weight": 0.0,
  --     "duration": 90,
  --     "distance": 0.0
  --   }
  -- ]
  
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  
  -- Constraints
  CONSTRAINT workout_exercises_order_unique UNIQUE (workout_id, exercise_order)
);

-- Indexes for workout_exercises table
-- Composite index covers both workout_id filtering and exercise_order sorting
CREATE INDEX IF NOT EXISTS idx_workout_exercises_order ON workout_exercises(workout_id, exercise_order);

-- RLS Policies for workout_exercises table
ALTER TABLE workout_exercises ENABLE ROW LEVEL SECURITY;

-- Drop existing policy if it exists (for idempotency)
DROP POLICY IF EXISTS "Users can manage exercises in their workouts" ON workout_exercises;

-- Create RLS Policy
CREATE POLICY "Users can manage exercises in their workouts"
  ON workout_exercises FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM workouts 
      WHERE workouts.id = workout_exercises.workout_id 
      AND workouts.user_id = auth.uid()
    )
  );

-- Trigger to automatically update updated_at on workout_exercises
DROP TRIGGER IF EXISTS update_workout_exercises_updated_at ON workout_exercises;
CREATE TRIGGER update_workout_exercises_updated_at
  BEFORE UPDATE ON workout_exercises
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- ============================================================================
-- Verification Queries (Optional - for testing)
-- ============================================================================

-- Verify function exists
-- SELECT proname FROM pg_proc WHERE proname = 'update_updated_at_column';

-- Verify triggers exist
-- SELECT trigger_name, event_object_table 
-- FROM information_schema.triggers 
-- WHERE trigger_name LIKE '%updated_at%';

-- Verify tables exist
-- SELECT table_name FROM information_schema.tables 
-- WHERE table_schema = 'public' 
-- AND table_name IN ('workouts', 'workout_exercises');

-- ============================================================================
-- Notes:
-- ============================================================================
-- 1. This script is idempotent - it can be run multiple times safely
-- 2. To disable RLS for testing, run:
--    ALTER TABLE workouts DISABLE ROW LEVEL SECURITY;
--    ALTER TABLE workout_exercises DISABLE ROW LEVEL SECURITY;
-- 3. To re-enable RLS:
--    ALTER TABLE workouts ENABLE ROW LEVEL SECURITY;
--    ALTER TABLE workout_exercises ENABLE ROW LEVEL SECURITY;
-- 4. The triggers will automatically update updated_at on any UPDATE operation
-- 5. The function update_updated_at_column() can be reused for other tables
-- ============================================================================

