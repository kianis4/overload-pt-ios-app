# 05 – Project Roadmap & Sprint Plan

This document outlines the planned sprints for the development of Overload PT. Each sprint is approximately two weeks long.

**Current Date:** June 12, 2025  
**Target v1 TestFlight:** ~Mid-October 2025

| Sprint | Dates (Approx.)      | Theme                        | Key Deliverables & Acceptance Criteria                                                                                                |
|--------|----------------------|------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| **0**  | **Jun 12 – Jun 25**  | **Foundation & Documentation** | **(Current Sprint)** Git repository initialized. CI/CD pipeline basic setup (e.g., lint on PR). Core documentation drafted and reviewed (Spec, Architecture, Data Model, AI API, Roadmap). Xcode project structure created. Spec & Arch merged. |
| 1      | Jun 26 – Jul 9       | Data Layer Foundation        | All SwiftData models (`Exercise`, `WorkoutSplit`, `SplitDay`, `PlannedExercise`, `ScheduledWorkout`, `SetEntry`, `UserPreferences`, `BodyweightRecord`) implemented. Basic CRUD operations functional for all entities. Seed database with a sample list of common exercises. Unit tests for data model logic. |
| 2      | Jul 10 – Jul 23      | Split Creation & Management  | UI for creating, viewing, editing, and deleting `WorkoutSplit` entities. UI for adding, editing, reordering, and deleting `SplitDay` entities within a split. UI for adding, removing, and reordering `PlannedExercise` items within a `SplitDay`, including setting target sets/reps. Exercise picker implemented with search/filter. |
| 3      | Jul 24 – Aug 6       | Calendar & Workout Scheduling | Calendar view (monthly) implemented. Ability to assign a `SplitDay` to a specific date, creating a `ScheduledWorkout`. View planned workouts on the calendar. Basic UI for "Today's Workout" screen, showing exercises from the scheduled `SplitDay`. |
| 4      | Aug 7 – Aug 20       | Workout Logging (Core)       | Implement the `WorkoutLogger` screen: input fields for weight, reps, RPE for each `SetEntry`. Start/manage rest timer. Save `SetEntry` data to the `ScheduledWorkout`. Mark sets and exercises as complete. Full offline logging capability for a workout session. |
| 5      | Aug 21 – Sep 3       | Progress Tracking & Charts   | Develop the "Progress" tab. Implement Swift Charts to display: Estimated 1RM for selected exercises over time. Total training volume (exercise, muscle group) over time. Bodyweight trend (if HealthKit data available). Filters for date ranges and exercises. Data aggregation logic for charts. |
| 6      | Sep 4 – Sep 17       | AI Coach - Basic Integration | Create the "AI Coach" tab with a basic chat interface. Implement API calls to OpenAI (as per `04-ai-api.md`) for the "Suggest Next Increment" feature based on selected logged exercise. Display AI suggestions and reasoning in the chat. Securely manage API key. |
| 7      | Sep 18 – Oct 1       | Polish, HealthKit & Testing  | Refine UI/UX across the app based on initial self-testing. Implement HealthKit integration for reading bodyweight data. Conduct thorough accessibility pass (VoiceOver, Dynamic Type). Write more unit and UI tests to reach coverage goals (≥80% unit, ≥70% UI). Address bugs found. |
| 8      | Oct 2 – Oct 15       | Beta Prep & TestFlight       | Final bug fixes and performance optimizations. Prepare App Store Connect metadata (screenshots, description). Build and distribute to TestFlight for a small group of beta testers. Set up feedback collection mechanism. |
| V1     | Mid/Late Oct 2025    | Public TestFlight / Release  | Address critical feedback from beta testers. Make final adjustments. Submit to App Store if quality meets V1 standards for a public TestFlight or initial release.                                     |

**Key Milestones:**
*   **End of Sprint 0 (Jun 25):** All foundational documents complete and project setup green.
*   **End of Sprint 4 (Aug 20):** Core workout logging functionality complete and stable.
*   **End of Sprint 6 (Sep 17):** Basic AI coaching features integrated.
*   **End of Sprint 8 (Oct 15):** App ready for wider TestFlight beta.

This roadmap will be reviewed at the beginning of each sprint and adjusted as necessary based on progress and any emerging priorities.

---
**Next action** → Update `CONTRIBUTING.md`.