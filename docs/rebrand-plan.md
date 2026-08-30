# Rebrand Plan: Couples Workout App

*"Sweat together, grow together."* — A couples-first workout planner, partner, and tracker with social photo sharing.

---

## Current State: Workouch

A **solo** fitness app with Clean Architecture (BLoC/Cubit + Supabase), featuring AI workout generation, exercise library (1000+), session tracking, personal records, week streaks, and RevenueCat subscriptions. ~230 Dart files, well-structured feature modules.

---

## I. CORE COUPLE FEATURES

### 1. Partner Linking System
- **Invite by code/QR/deep link** — one partner generates a code, the other scans or enters it
- **Partner profile visible** on your dashboard (avatar, streak, last workout)
- **Relationship status** stored in Supabase (`couples` table: user_a, user_b, linked_at, status)
- **Unlinking flow** with confirmation and data separation
- **New Supabase tables:** `couples`, `couple_invites`

### 2. Shared Workout Plans
- **Create workouts together** — either partner can create/edit shared workouts
- **Assign workouts** to your partner (push notification: "Your partner planned Leg Day for you!")
- **Synced workout templates** — both see the same workout library
- **"Do Together" mode** — both start the same workout simultaneously with live status sync
- **Workout visibility:** `private` (solo) vs `shared` (couple) flag on existing `workouts` table

### 3. Partner Workout Sessions
- **Real-time partner tracking** — see your partner's current exercise, set, and rest status via Supabase Realtime
- **Live encouragement** — tap to send quick reactions during a session (fire, flexing arm, heart, clap)
- **Side-by-side session comparison** after both complete the same workout
- **"Waiting for you"** screen when one finishes before the other

### 4. Couple Dashboard
- **Combined stats:** total workouts together, combined volume, couple streak
- **Individual vs. couple views** toggle on the home tab
- **"Who trained more this week?"** friendly leaderboard
- **Couple streak** — consecutive weeks where BOTH partners worked out
- **Milestone celebrations** (first workout together, 10 couple sessions, 1-month streak, etc.)

---

## II. LOCKET-STYLE PHOTO FEATURE

### 5. Workout Moments (Photo Sharing)
- **Post-workout camera** — after finishing a session, prompt to take a selfie/photo
- **Widget-style feed** — partner sees your photo appear on their home screen (like Locket)
- **Photo + workout overlay** — auto-overlay workout stats on the photo (duration, volume, exercises)
- **Reactions** — heart, fire, flexing, laugh reactions on photos
- **Caption** — short text with the photo
- **History gallery** — scroll through all shared moments chronologically

### 6. Anytime Photo Sharing
- **Not just post-workout** — share meal prep, gym fits, progress pics, rest day vibes
- **Photo categories/tags:** post-workout, meal, progress, motivation, random
- **Daily photo prompt** — notification: "Share a moment with your partner today!"
- **Streak indicator** for consecutive days of photo sharing

### 7. Photo Storage Architecture
- **Supabase Storage** bucket for couple photos
- **New tables:** `couple_moments` (id, couple_id, user_id, photo_url, caption, category, workout_session_id, stats_overlay, created_at)
- **`moment_reactions`** (id, moment_id, user_id, reaction_type, created_at)
- **Image compression** before upload (using `image_picker` + `flutter_image_compress`)
- **Thumbnail generation** for feed performance

---

## III. COMMUNICATION & MOTIVATION

### 8. In-App Messaging (Lightweight)
- **Quick reactions** — preset emoji/sticker packs (fitness-themed)
- **Voice notes** — short voice messages for motivation ("Let's go babe, push through!")
- **No full chat** — keep it lightweight and fitness-focused, not a messenger replacement

### 9. Challenges & Goals
- **Couple challenges:** "Complete 20 workouts together this month"
- **Personal challenges assigned by partner:** "I challenge you to bench 100kg"
- **Weekly/monthly goals** with progress bars for both partners
- **Challenge templates:** consistency (X days/week), volume (total kg), streak-based
- **Reward system:** unlock couple badges/achievements

### 10. Notifications & Nudges
- **"Your partner just started a workout!"** — motivational push
- **"Your partner finished Chest Day in 45min"** — post-workout notification
- **"It's been 3 days since your last workout"** — gentle nudge from partner's perspective
- **Scheduled reminders** — partner can set workout reminders for you
- **"Good morning" auto-prompt** — daily motivation quote or check-in

---

## IV. PROGRESS & ANALYTICS (COUPLE-ENHANCED)

### 11. Couple Progress Tracking
- **Side-by-side body metrics** — weight/BMI trends for both
- **Combined personal records** board
- **"Couple strength score"** — composite metric based on both partners' lifts
- **Progress photo timeline** — monthly photo collage (from Workout Moments)
- **Export couple report** — PDF/image summary of monthly couple fitness

### 12. Enhanced Statistics
- **Synced vs. solo sessions** breakdown
- **Most done exercise together**
- **Average session duration comparison**
- **Calendar heat map** showing both partners' activity (two colors, overlapping = combined color)
- **"Compatibility score"** — fun metric based on workout overlap, timing, consistency

---

## V. GAMIFICATION

### 13. Couple Achievements & Badges
- "First Sweat Together" — complete first synced workout
- "Iron Couple" — both hit a PR in the same week
- "Streak Masters" — 4-week couple streak
- "Locket Lovers" — 7-day photo sharing streak
- "Volume Kings/Queens" — combined 10,000kg in a month
- "Early Birds" — both workout before 8am
- Display on profile and shareable to social media

### 14. Leaderboard & Social
- **Couple vs. couple leaderboard** (opt-in, anonymous or friends)
- **Share achievements** to Instagram Stories / TikTok
- **Invite other couples** to compete

---

## VI. ONBOARDING REBRAND

### 15. Revamped Onboarding Flow
1. Welcome — "Better together" branding
2. Sign up / Sign in
3. Personal profile (keep existing: age, gender, height, weight, activity level)
4. **NEW: Link your partner** (or skip for now)
5. **NEW: Couple goals** — what do you want to achieve together?
6. Main lifts (keep existing)
7. **NEW: Photo permissions** — camera access for Workout Moments
8. Dashboard

---

## VII. SUBSCRIPTION REBRAND

### 16. Couple-Oriented Pricing
- **Free tier:** Solo features + 1 partner link + 5 photos/month + 1 AI workout/month
- **Duo Monthly:** Unlimited photos, shared workouts, couple stats, challenges, 50 AI workouts
- **Duo Yearly:** Same as monthly, discounted
- **Duo Lifetime:** One-time purchase for both partners
- **Key insight:** One subscription covers BOTH partners (linked accounts share the plan)

---

## VIII. TECHNICAL ARCHITECTURE ADDITIONS

### New Supabase Tables
```
couples (id, user_a_id, user_b_id, linked_at, status, couple_streak)
couple_invites (id, inviter_id, invite_code, expires_at, used_by)
couple_moments (id, couple_id, user_id, photo_url, thumbnail_url, caption, category, workout_session_id, stats_overlay_json, created_at)
moment_reactions (id, moment_id, user_id, reaction_type, created_at)
couple_challenges (id, couple_id, title, type, target_value, current_value_a, current_value_b, start_date, end_date, status)
couple_achievements (id, couple_id, achievement_type, unlocked_at)
partner_nudges (id, from_user_id, to_user_id, couple_id, type, message, created_at, read_at)
```

### New Feature Modules
```
lib/features/
├── couple/              # Partner linking, couple profile, invites
├── moments/             # Photo capture, feed, reactions (Locket-like)
├── challenges/          # Couple challenges & goals
├── achievements/        # Badges & gamification
└── notifications/       # Push notification management
```

### Key New Dependencies
- `image_picker` — camera/gallery access
- `flutter_image_compress` — photo compression before upload
- `supabase_flutter` (Realtime) — live partner activity sync
- `firebase_messaging` — push notifications
- `share_plus` — share achievements/photos externally
- `camera` — custom camera UI for Workout Moments
- `path_provider` — local image caching
- `cached_network_image` (already have) — photo feed performance

### Supabase Realtime Usage
- **Live workout status** — broadcast current exercise/set to partner
- **Photo notifications** — instant feed update when partner posts
- **Nudge delivery** — real-time reaction/message delivery

---

## IX. BRANDING & DESIGN DIRECTION

### Name Ideas
| Name | Vibe |
|------|------|
| **FitTwo** | Clean, obvious, memorable |
| **SweatHeart** | Playful, romantic |
| **LiftMate** | Partner-focused |
| **DuoFit** | Simple, couple-oriented |
| **IronBond** | Strong, relationship-focused |
| **RepTogether** | Action-oriented |

### Design Direction
- Keep the existing **pastel palette** — it already feels warm and couple-friendly
- Add a **secondary warm tone** (soft pink/coral) for couple-specific UI
- **Dual avatar** motif in branding (two silhouettes, intertwined)
- **Heart + dumbbell** icon as app logo concept
- Photo features use a **polaroid/instant-camera** aesthetic
- Achievements use a **badge/medal** visual language

---

## X. IMPLEMENTATION PRIORITY (Suggested Phases)

| Phase | Features | Effort |
|-------|----------|--------|
| **Phase 1** | Rebrand (name, logo, colors), Partner linking, Shared dashboard | 2-3 weeks |
| **Phase 2** | Workout Moments (photo capture + feed + reactions) | 2-3 weeks |
| **Phase 3** | Shared workouts, Workout assignment, Real-time partner status | 2-3 weeks |
| **Phase 4** | Challenges, Achievements, Gamification | 2 weeks |
| **Phase 5** | Couple stats, Leaderboard, Social sharing | 1-2 weeks |
| **Phase 6** | Notifications, Nudges, Daily prompts | 1-2 weeks |
| **Phase 7** | Subscription rebrand, Couple pricing | 1 week |
