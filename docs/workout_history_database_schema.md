# Workout History Database Schema Design

## Overview
This document outlines the database schema design for storing workout history in Supabase (PostgreSQL). It extends the workout schema to track **completed workout sessions**, exercises performed, **personal records**, and **week streaks**.

> **Quick Start**: For a complete, executable SQL script, see [`workout_history_database_schema.sql`](./workout_history_database_schema.sql). Run `workout_database_schema.sql` first, then copy and paste this script into the Supabase SQL Editor.

## Prerequisites

- `workout_database_schema.sql` must be run first (creates `workouts`, `workout_exercises`, and `update_updated_at_column()` function)

## Database Schema

### Schema Structure
- **4 tables**: `workout_sessions`, `workout_session_exercises`, `exercise_personal_records`, `user_workout_weeks`
- **get_week_streak(p_user_id)**: SQL function returning consecutive week streak count (called via Supabase RPC)
- **workout_sessions**: One row per completed workout
- **workout_session_exercises**: Exercises performed in each session (normalized)
- **exercise_personal_records**: PRs for display on History tab
- **user_workout_weeks**: Weeks with at least 1 workout (for week streak)
- **Sets stored as JSONB**: Same structure as `workout_exercises.sets`
- **RLS**: Row Level Security on all tables

---

### Table 1: `workout_sessions`

Stores records of completed workout sessions.

**Columns:**
| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID, PK | Unique identifier |
| `user_id` | UUID, FK | References `auth.users(id)` with CASCADE delete |
| `workout_id` | UUID, FK (nullable) | References `workouts(id)`, SET NULL on delete. Null for ad-hoc workouts |
| `workout_name` | TEXT | Snapshot of workout name at completion |
| `started_at` | TIMESTAMPTZ | When the session started |
| `completed_at` | TIMESTAMPTZ | When the session finished |
| `total_duration_seconds` | INTEGER | Total workout duration (>= 0) |
| `total_volume_kg` | DECIMAL | Sum of (weight × reps) across all sets |
| `total_sets` | INTEGER | Total sets completed |
| `total_exercises` | INTEGER | Number of exercises performed |
| `calories_burned` | DECIMAL (nullable) | Estimated calories (from TDEE/activity) |
| `notes` | TEXT (nullable) | Optional user notes |
| `created_at` | TIMESTAMPTZ | Row creation timestamp |

**Indexes:**
- `idx_workout_sessions_user_id`: Index on `user_id`
- `idx_workout_sessions_completed_at`: Index on `completed_at` for date filtering
- `idx_workout_sessions_user_completed_at`: Composite index for calendar/stats queries

**RLS Policies:**
- Users can view, create, update, and delete only their own workout sessions

---

### Table 2: `workout_session_exercises`

Stores exercises performed within each workout session with snapshot data and actual sets.

**Columns:**
| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID, PK | Unique identifier |
| `workout_session_id` | UUID, FK | References `workout_sessions(id)` with CASCADE delete |
| `exercise_order` | INTEGER | Order in session (0, 1, 2, ...) |
| `exercise_id` | TEXT | Reference to external exercise API |
| `name` | TEXT | Exercise name |
| `gif_url` | TEXT | URL to exercise GIF |
| `set_type` | TEXT | `weightBased`, `timeBased`, `distanceBased`, `repsOnly` |
| `sets` | JSONB | Performed sets (same structure as `workout_exercises.sets`) |
| `rest_time_between_sets` | INTEGER | Rest time in seconds (>= 0) |
| `total_volume_kg` | DECIMAL | (weight × reps × sets) for weight-based |
| `created_at` | TIMESTAMPTZ | Row creation timestamp |

**Note:** Best weight/reps per exercise can be derived from the `sets` JSONB when needed (e.g., for display or analytics).

**Sets JSONB Structure:** (same as workout_exercises)
```json
[
  { "type": "weightBased", "sets": 3, "reps": 10, "weight": 50.0, "duration": 0, "distance": 0.0 },
  { "type": "timeBased", "sets": 0, "reps": 0, "weight": 0.0, "duration": 90, "distance": 0.0 }
]
```

**Indexes:**
- `idx_workout_session_exercises_session_id`: Index on `workout_session_id`
- `idx_workout_session_exercises_order`: Composite index for ordering

**Constraints:**
- `workout_session_exercises_order_unique`: Unique on `(workout_session_id, exercise_order)`

**RLS Policies:**
- Users can manage exercises only in their own workout sessions (via session's user_id)

---

### Table 3: `exercise_personal_records`

Stores personal records per exercise for display on the History tab.

**Columns:**
| Column | Type | Description |
|--------|------|-------------|
| `id` | UUID, PK | Unique identifier |
| `user_id` | UUID, FK | References `auth.users(id)` with CASCADE delete |
| `exercise_id` | TEXT | Exercise ID |
| `name` | TEXT | Exercise name (snapshot for display) |
| `gif_url` | TEXT | URL to exercise GIF |
| `max_reps` | INTEGER | Best reps achieved |
| `max_weight_kg` | DECIMAL | Best weight achieved (kg) |
| `max_duration_seconds` | INTEGER | Best duration (for time-based) |
| `max_distance_meters` | DECIMAL | Best distance (for distance-based) |
| `set_type` | TEXT | `weightBased`, `timeBased`, `distanceBased`, `repsOnly` |
| `pr_date` | DATE | Date the PR was achieved |
| `is_visible_on_history` | BOOLEAN | Whether to show on History tab (default true) |
| `created_at` | TIMESTAMPTZ | Row creation |
| `updated_at` | TIMESTAMPTZ | Last update (auto-updated by trigger) |

**Constraints:**
- `exercise_personal_records_user_exercise_unique`: UNIQUE on `(user_id, exercise_id)` — one PR per user per exercise

**Indexes:**
- `idx_exercise_pr_user_id`: Index on `user_id`
- Unique constraint on `(user_id, exercise_id)` also provides an index for lookups
- `idx_exercise_pr_user_date`: For date-range queries
- `idx_exercise_pr_user_visible`: Partial index for visible PRs only

**RLS Policies:**
- Users can view, create, update, and delete only their own PRs

**Triggers:**
- `update_exercise_personal_records_updated_at`: Updates `updated_at` on UPDATE

---

### Table 4: `user_workout_weeks`

Stores weeks where the user completed at least 1 workout. Used for week streak calculation (consecutive weeks with workouts).

**Columns:**
| Column | Type | Description |
|--------|------|-------------|
| `user_id` | UUID, FK | References `auth.users(id)` with CASCADE delete |
| `week_start_date` | DATE | Monday of the week (ISO week start) |
| `workout_count` | INTEGER | Number of workouts in that week (>= 1) |
| `created_at` | TIMESTAMPTZ | Row creation timestamp |

**Constraints:**
- `PRIMARY KEY (user_id, week_start_date)` — one row per user per week

**Indexes:**
- `idx_user_workout_weeks_user_week`: Composite index on `(user_id, week_start_date DESC)` for streak queries

**RLS Policies:**
- Users can view, create, update, and delete only their own workout weeks

**Sync logic:** Upsert on `workout_sessions` insert; decrement or delete row on `workout_sessions` delete.

---

## Use Cases

| Feature | Query |
|---------|-------|
| **Calendar: days with workouts** | `SELECT 1 FROM workout_sessions WHERE user_id = ? AND (completed_at AT TIME ZONE 'UTC')::date = ? LIMIT 1` |
| **Summary: workouts this month** | `SELECT COUNT(*) FROM workout_sessions WHERE user_id = ? AND completed_at >= ? AND completed_at < ?` |
| **Summary: total volume this month** | `SELECT COALESCE(SUM(total_volume_kg), 0) FROM workout_sessions WHERE user_id = ? AND completed_at >= ? AND completed_at < ?` |
| **Summary: total time this month** | `SELECT COALESCE(SUM(total_duration_seconds), 0) FROM workout_sessions WHERE user_id = ? AND completed_at >= ? AND completed_at < ?` |
| **Day detail: sessions for date** | `SELECT * FROM workout_sessions WHERE user_id = ? AND (completed_at AT TIME ZONE 'UTC')::date = ? ORDER BY completed_at DESC` |
| **PRs for History tab** | `SELECT * FROM exercise_personal_records WHERE user_id = ? AND is_visible_on_history = true ORDER BY pr_date DESC` |
| **Week streak** | See [Week Streak Query](#week-streak-query) below |

#### Week Streak Query

The streak = consecutive weeks with at least 1 workout, counting backwards from the most recent week.

**Recursive CTE (recommended):**
```sql
WITH RECURSIVE most_recent_week AS (
  SELECT week_start_date
  FROM user_workout_weeks
  WHERE user_id = $1  -- or auth.uid()
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
    ON uww.user_id = $1
   AND uww.week_start_date = sw.week_start_date - INTERVAL '7 days'
)
SELECT COALESCE(MAX(streak), 0)::INTEGER AS week_streak
FROM streak_walk;
```

**Optional SQL function:**
```sql
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
```

Usage: `SELECT get_week_streak(auth.uid());`

---

## Data Flow

1. **On workout completion** (WorkoutFinishPage):
   - Insert into `workout_sessions` (workout name, duration, volume, etc.)
   - Insert rows into `workout_session_exercises` for each completed exercise with actual sets

2. **History tab**:
   - Calendar: Query `workout_sessions` by user and date
   - Summary stats: Aggregate `workout_sessions` by month
   - PR display: Query `exercise_personal_records` where `is_visible_on_history = true`
   - Week streak: Query `user_workout_weeks` via recursive CTE or `get_week_streak()` function

3. **user_workout_weeks**:
   - On workout completion: Upsert row for `(user_id, week_start_date)` — increment `workout_count` if exists, else insert
   - On workout deletion: Decrement `workout_count`; delete row if count reaches 0
   - `week_start_date` = Monday of the week containing `workout_sessions.completed_at`

4. **exercise_personal_records** is independent (no FK to workout tables); PRs are managed separately.

---

## Notes

- **workout_id nullable**: Ad-hoc workouts (not from a template) use `workout_id = NULL`
- **Snapshot data**: `workout_name`, exercise `name`/`gif_url` stored to preserve history even if templates or API data change
- **Cascading deletes**: Deleting a session deletes its exercises; deleting a user deletes all their sessions, PRs, and workout weeks
- **user_workout_weeks sync**: Requires triggers or application logic to upsert on `workout_sessions` insert and decrement/delete on `workout_sessions` delete
- **Week definition**: `week_start_date` uses Monday (ISO 8601). Derive with `date_trunc('week', completed_at)::date` in PostgreSQL
- **Idempotent script**: Can be run multiple times safely (uses IF NOT EXISTS, DROP POLICY IF EXISTS)
