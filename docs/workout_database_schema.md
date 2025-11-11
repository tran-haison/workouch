# Workout Database Schema Design

## Overview
This document outlines the database schema design for storing workouts in Supabase (PostgreSQL).

> **Quick Start**: For a complete, executable SQL script, see [`workout_database_schema.sql`](./workout_database_schema.sql). You can copy and paste this script directly into the Supabase SQL Editor.

## Database Schema

### Schema Structure
- **2 tables**: `workouts` and `workout_exercises`
- **Sets stored as JSONB**: Sets are stored as a JSONB array within `workout_exercises` table
- **Normalized design**: Exercises are stored separately from workouts for better querying and maintenance
- **Automatic timestamps**: Triggers automatically update `updated_at` column on UPDATE operations

### Function: `update_updated_at_column()`
Reusable function to automatically update the `updated_at` column to the current timestamp when a row is updated.

**Implementation**: See [`workout_database_schema.sql`](./workout_database_schema.sql) for the complete function definition.

### Table 1: `workouts`
Main table for storing workout templates.

**Columns:**
- `id` (UUID, Primary Key): Unique identifier for the workout
- `user_id` (UUID, Foreign Key): References `auth.users(id)` with CASCADE delete
- `name` (TEXT): Workout name
- `rest_time_between_exercises` (INTEGER): Rest time in seconds (>= 0)
- `created_at` (TIMESTAMPTZ): Timestamp when the workout was created
- `updated_at` (TIMESTAMPTZ): Timestamp when the workout was last updated

**Indexes:**
- `idx_workouts_user_id`: Index on `user_id` for efficient user-based queries

**RLS Policies:**
- Users can view, create, update, and delete only their own workouts
- Policies use `auth.uid() = user_id` to enforce data isolation

**Triggers:**
- `update_workouts_updated_at`: Automatically updates `updated_at` on UPDATE operations

**Implementation**: See [`workout_database_schema.sql`](./workout_database_schema.sql) for the complete table definition.

### Table 2: `workout_exercises`
Stores exercises within workouts with snapshot data, settings, and sets.

**Columns:**
- `id` (UUID, Primary Key): Unique identifier for the exercise entry
- `workout_id` (UUID, Foreign Key): References `workouts(id)` with CASCADE delete
- `exercise_order` (INTEGER): Order of exercise in workout (0, 1, 2, ...), must be >= 0
- `exercise_id` (TEXT): Reference to external exercise API
- `name` (TEXT): Exercise name
- `gif_url` (TEXT): URL to exercise GIF
- `description` (TEXT): Exercise description
- `target_muscles` (TEXT[]): Array of target muscle groups
- `body_parts` (TEXT[]): Array of body parts
- `equipments` (TEXT[]): Array of equipment needed
- `secondary_muscles` (TEXT[]): Array of secondary muscles
- `instructions` (TEXT[]): Array of exercise instructions
- `rest_time_between_sets` (INTEGER): Rest time between sets in seconds (>= 0)
- `set_type` (TEXT, nullable): Type of set ('weightBased', 'timeBased', 'distanceBased', 'repsOnly')
- `sets` (JSONB): Array of sets stored as JSONB (see structure below)
- `created_at` (TIMESTAMPTZ): Timestamp when the exercise was added
- `updated_at` (TIMESTAMPTZ): Timestamp when the exercise was last updated

**Sets JSONB Structure:**
```json
[
  {
    "type": "weightBased",
    "sets": 3,
    "reps": 10,
    "weight": 50.0,
    "duration": 0,
    "distance": 0.0
  },
  {
    "type": "timeBased",
    "sets": 0,
    "reps": 0,
    "weight": 0.0,
    "duration": 90,
    "distance": 0.0
  }
]
```

**Indexes:**
- `idx_workout_exercises_order`: Composite index on `(workout_id, exercise_order)` for efficient queries and ordering

**Constraints:**
- `workout_exercises_order_unique`: Unique constraint on `(workout_id, exercise_order)` to prevent duplicate exercise positions

**RLS Policies:**
- Users can manage exercises only in their own workouts
- Policy checks if the workout belongs to the authenticated user

**Triggers:**
- `update_workout_exercises_updated_at`: Automatically updates `updated_at` on UPDATE operations

**Implementation**: See [`workout_database_schema.sql`](./workout_database_schema.sql) for the complete table definition.

## Architecture

### Data Flow
```
UI (WorkoutCubit)
  -> Repository Interface
    -> Repository Implementation
      -> Remote Data Source (Supabase)
        -> Database (PostgreSQL)
          -> Returns data
            -> Data Source converts to DTO
              -> Repository returns Either<Error, T>
                -> Cubit updates state
                  -> UI rebuilds
```

### Key Components

1. **Repository Interface** (`lib/features/workout/domain/repositories/workout_repository.dart`)
   - Defines contract for workout operations
   - Returns `Either<Error, T>`

2. **Repository Implementation** (`lib/features/workout/data/repositories/workout_repository_impl.dart`)
   - Implements repository interface
   - Handles data conversion (Entity <-> DTO)
   - Error handling

3. **Remote Data Source** (`lib/features/workout/data/datasources/workout_remote_datasource.dart`)
   - Direct Supabase client interaction
   - CRUD operations
   - Query building

4. **DTOs** (Already created)
   - `WorkoutDto`
   - `WorkingExerciseDto`
   - `WorkingSetDto`

## Benefits

✅ **Scalable**: Normalized structure supports large datasets
✅ **Secure**: Row Level Security (RLS) ensures data isolation
✅ **Queryable**: Indexes on foreign keys and order fields
✅ **Maintainable**: Clear separation of concerns
✅ **Flexible**: Easy to extend (e.g., workout sessions, analytics)
✅ **Type-safe**: DTOs provide structure and validation

## Considerations

- **Exercise Data Snapshot**: Stored in `workout_exercises` to preserve historical data even if external API changes
- **Ordering**: Maintained via `exercise_order` column (sets order is maintained in JSONB array)
- **Sets Storage**: Sets stored as JSONB array for flexibility and simplicity
- **Set Type Flexibility**: JSONB structure allows all set types with type field determining which fields are used
- **Cascading Deletes**: Deleting workout automatically deletes exercises
- **Timestamps**: `created_at` and `updated_at` for audit trail
  - `created_at` is set automatically on INSERT via `DEFAULT NOW()`
  - `updated_at` is set automatically on INSERT via `DEFAULT NOW()` and on UPDATE via trigger
- **Automatic Timestamp Updates**: Triggers automatically update `updated_at` when any row is updated
- **JSONB Benefits**: 
  - Flexible schema for sets
  - Easy to serialize/deserialize from DTOs
  - Can be queried with PostgreSQL JSONB operators if needed
  - Maintains array order naturally

## Future Enhancements

- **Workout Sessions**: Track completed workouts with timestamps and performance data
- **Analytics**: Query workout history for progress tracking
- **Sharing**: Share workouts between users
- **Templates**: Save workout templates separate from instances
- **Progress Tracking**: Track performance metrics over time

