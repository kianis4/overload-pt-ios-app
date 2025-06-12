<!-- filepath: /Users/suley/Desktop/github/overload-pt-ios-app/docs/01-spec.md -->
# 01 – Product Spec

## 1 Product vision
**Overload PT** is an iOS application designed to empower weightlifters of all levels to systematically apply the principle of *progressive overload* with clarity and precision. Users can easily create and customize workout splits (e.g., Push/Pull/Legs), assign them to a calendar, and receive exact guidance for each gym session. The app will meticulously track performance (weights, reps, RPE), allowing users to visualize their strength and volume progression over time. An integrated AI coach, powered by OpenAI's GPT-4o, will offer personalized advice on weight/rep increments, answer training-related questions, and provide form cues, eliminating guesswork and fostering consistent improvement.

**Success metrics (v‑1)**

| Metric | Target after 4 weeks on TestFlight |
|--------|------------------------------------|
| DAU/WAU | ≥ 30 % |
| Workout logged completion rate | ≥ 80 % of started sessions |
| Avg chatbot questions per workout | ≥ 1 |
| Split Creation Rate | ≥ 50% of users create at least one custom split |
| Weekly Progress Logged | ≥ 70% of active users log at least one workout per week |


## 2 Personas
| Persona | Needs | Pain points |
|---------|-------|-------------|
| **Sarah — New lifter** (22 y.o., student) | Simple split builder, pre-set beginner templates, clear exercise instructions & form cues (text/video links), basic progress tracking. Wants to feel confident and see early wins. | Overwhelmed by complex spreadsheets or generic fitness apps. Unsure how to progress safely. Intimidated by gym jargon. |
| **Liam — Intermediate lifter** (30 y.o., software dev) | Detailed data tracking (1RM, volume, RPE), ability to customize splits extensively, plate math assistance, micro-progress visualization. Wants to break plateaus and optimize training. | Frustrated with manual tracking in notes or spreadsheets. Can’t easily see long-term trends or how RPE affects performance. Struggles with calculating next logical weight jumps. |
| **Alex — Advanced/Coach Aspirant** (28 y.o., personal trainer in training) | Efficiently manage multiple complex splits (even if for self), exportable progress data, ability to quickly note variations or feelings during a workout. Wants tools that reflect a professional approach to training. | Manually updating and analyzing client (or personal advanced) programs is time-consuming. Needs a robust system for detailed record-keeping and analysis. |

## 3 Core use‑case flow (MVP)
1.  **Onboarding:**
    *   User introduces themselves (optional name).
    *   Sets experience level (Beginner, Intermediate, Advanced).
    *   Selects primary goal (e.g., Strength, Hypertrophy, Maintenance).
    *   Optionally grants HealthKit access for bodyweight tracking.
2.  **Create/Import Split:**
    *   User can choose from pre-defined templates (e.g., Full Body 3x/week, PPL, Upper/Lower).
    *   User can create a custom split, naming it (e.g., "My Hypertrophy Block").
    *   Within a split, user defines workout days (e.g., "Push Day A", "Pull Day", "Legs").
    *   For each workout day, user searches and adds exercises from a comprehensive database (includes variations, e.g., "Incline Dumbbell Press," "Barbell Squat").
    *   User specifies target sets and reps for each exercise (e.g., 3 sets of 8-12 reps).
3.  **Schedule Workouts:**
    *   User assigns their created split (or specific workout days) to days on an in-app calendar.
    *   Can set recurring schedules (e.g., PPL on Mon-Wed-Fri).
4.  **Log Workout:**
    *   On a scheduled workout day, user opens the app to see "Today's Workout."
    *   For each planned exercise, user logs:
        *   Weight lifted (kg/lbs).
        *   Reps completed for each set.
        *   Rate of Perceived Exertion (RPE) for each set (optional).
        *   Rest times (optional, with a built-in timer).
    *   User can add notes to sets or exercises (e.g., "Felt strong," "Reduced weight due to form").
    *   User can easily add/remove sets or substitute exercises if needed.
5.  **View Progress:**
    *   Dedicated "Progress" section with charts and stats.
    *   Visualizes Estimated 1RM (One-Rep Max) for key lifts over time.
    *   Tracks total training volume (sets x reps x weight) per exercise, muscle group, or workout.
    *   Shows bodyweight trends (if HealthKit enabled).
    *   Filters available for date ranges, specific exercises, etc.
6.  **Ask AI Coach:**
    *   Access a chat interface.
    *   Ask for suggestions on next week's weight/rep increments for a specific exercise based on recent performance.
    *   Ask general training questions, form advice (text-based), or clarification on programming.

## 4 Screens & components
| Screen | Key components |
|--------|----------------|
| **Onboarding** | App intro slides, experience level selector, goal selector (strength, hypertrophy, etc.), HealthKit authorization prompt. |
| **Home ("Today")** | Date display, summary of today's scheduled workout (exercises, sets/reps), quick "Start Workout" button, upcoming workout days. |
| **Splits Tab** | List of user's created splits, "+ Create Split" button. Drilldown to: |
|   **Split Editor** | Split name field. List of Workout Days within the split (e.g., "Push", "Pull"). Ability to add, delete, reorder Workout Days. Drilldown to: |
|     **Workout Day Editor** | Workout Day name field (e.g., "Push Day 1"). List of exercises for that day. "Add Exercise" button (opens Exercise Picker). Ability to reorder, delete exercises. Set target sets/reps for each exercise. |
|       **Exercise Picker** | Search bar for exercises, filter by muscle group/equipment. List of exercises with brief descriptions/icons. |
| **Calendar Tab** | Monthly view. Dots/indicators on days with planned/completed workouts. Tap a day to view/log/schedule a workout. |
| **Workout Logger** | Displays current exercise. Input fields for set number, weight, reps, RPE. Rest timer button. "Add Set" button. "Next Exercise" button. Notes field. Option to mark exercise/workout as complete. |
| **Progress Tab** | Tabbed interface or filter chips for different metrics (e.g., E1RM, Volume, Bodyweight). Swift Charts displaying trends. Date range selectors. Exercise selectors for specific drill-downs. |
| **AI Coach Tab** | ChatView interface (supports markdown for responses). Text input field for user questions. Pre-defined action buttons like "Suggest next weight for [last exercise]". |
| **Settings Tab** | User profile (name, avatar - optional). Units preference (kg/lbs). Data export (.csv option). Feedback link/contact support. App version. Manage HealthKit connection. Data privacy information. |

## 5 Tech stack
| Layer | Choice | Why |
|-------|--------|-----|
| Language | **Swift 6** (or latest stable) | Modern features, strong typing, performance, primary language for iOS. Concurrency features (async/await) are crucial. |
| UI | **SwiftUI 5** (or latest stable) | Declarative, modern, allows for rapid development and iteration. Better accessibility support out-of-the-box. |
| Persistence | **SwiftData** (+CloudKit sync) | Native Apple framework, declarative, integrates well with SwiftUI. CloudKit for seamless backup and multi-device sync. Offline-first support is inherent. |
| Charts | `SwiftUI.Chart` | Native, integrates seamlessly with SwiftUI, good performance for most use cases. |
| AI | OpenAI GPT-4o (or latest suitable model) via `openai-swift` library | State-of-the-art capabilities, good for conversational AI and structured data generation. `openai-swift` provides a convenient Swift interface. |
| CI/CD | GitHub Actions → fastlane | Free for public repos (and generous for private), highly customizable. Fastlane automates build, test, and deployment processes (e.g., to TestFlight). |
| Lint/Test | SwiftLint, XCTest (Unit & UI Tests) | SwiftLint for code style consistency. XCTest for ensuring reliability and catching regressions. Aim for high test coverage. |
| Analytics | (Optional V1+) Firebase Analytics / App Store Connect Analytics | To track success metrics and user behavior for future improvements. |

## 6 Architecture diagram
```mermaid
flowchart TD
    UI[SwiftUI Views] <---> VM(ViewModels<br/>@ObservableObject / @StateObject)
    VM -->|Intents & Data Requests| Repo[Repository Layer]
    Repo -->|CRUD Operations| DS[DataService (SwiftData + CloudKit)]
    DS --> SwiftData[(SwiftData Local Store)]
    DS --> CloudKit[(CloudKit Private Database)]
    Repo -->|API Calls| Net[NetworkService]
    Net -->|OpenAI API| AIService[AI Coach Service (OpenAI GPT-4o)]

    subgraph "Presentation Layer"
        UI
        VM
    end

    subgraph "Domain Layer"
        Repo
    end

    subgraph "Data Layer"
        DS
        SwiftData
        CloudKit
        Net
        AIService
    end
```

## 7 Data model overview
A detailed breakdown of the SwiftData entities can be found in [`docs/03-data-model.md`](docs/03-data-model.md). This will include models for Exercises, WorkoutSplits, WorkoutDays, LoggedSets, UserPreferences, etc.

## 8 Non‑functional requirements
*   **Offline‑first:** All core logging and split management functionality must work without an internet connection. Data syncs when connection is available.
*   **CloudKit Sync:** User data (splits, logs, preferences) should seamlessly sync across their iCloud-connected devices.
*   **Performance:** UI should be responsive (animations at 60fps). Data loading and processing should be efficient. App launch time < 2s.
*   **Accessibility:** Strong support for VoiceOver, Dynamic Type, and other iOS accessibility features.
*   **Test Coverage:** Aim for ≥ 80% unit test coverage for business logic and ≥ 70% UI test coverage for critical user flows.
*   **Data Privacy:** Clear communication about data usage, especially with HealthKit and AI services. All user-generated fitness data is private by default.
*   **Error Handling:** Graceful error handling and user-friendly messages for network issues, data validation, etc.

## 9 Road‑mapped sprints
| Sprint | Theme | Dates (Approx. 2 weeks each) | Key Deliverables |
|--------|-------|------------------------------|--------------------|
| 0 | Setup & Docs | Jun 12 – Jun 25 | Git repo, CI/CD pipeline (basic), finalized core docs (Spec, Arch, Data Model), project structure in Xcode. **(Current)** |
| 1 | Data Layer Foundation | Jun 26 – Jul 9 | SwiftData models implemented, basic CRUD operations for core entities, seed database with common exercises. |
| 2 | Split Creation & Management | Jul 10 – Jul 23 | UI for creating/editing splits, adding/removing workout days, assigning exercises to days (no logging yet). |
| 3 | Calendar & Workout Scheduling | Jul 24 – Aug 6 | Calendar view implemented, ability to schedule splits/workout days, view planned workouts on calendar. |
| 4 | Workout Logging | Aug 7 – Aug 20 | Core workout logging screen: input weight/reps/RPE, timer, save workout data. Offline capability. |
| 5 | Progress Tracking & Charts | Aug 21 – Sep 3 | Basic progress charts (e.g., E1RM for one exercise, total volume over time). Data aggregation logic. |
| 6 | AI Coach - Basic Integration | Sep 4 – Sep 17 | Simple chat interface, API call to OpenAI for "suggest next weight/reps" based on logged data. |
| 7 | Polish, HealthKit & Initial Testing | Sep 18 – Oct 1 | Refine UI/UX, implement HealthKit bodyweight sync, basic accessibility pass (VoiceOver, Dynamic Type), prepare for internal testing. |
| 8 | Beta Testing & Feedback Iteration | Oct 2 – Oct 15 | Wider TestFlight release, gather user feedback, bug fixing, small improvements based on feedback. |
| V1 Release | Target: End of Oct | App Store Submission | |

---

**Next action** → Review and finalize this Product Spec. Then proceed to update `02-architecture.md` and `03-data-model.md`.