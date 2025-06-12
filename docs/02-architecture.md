# 02 – Architecture

This document outlines the architectural decisions for the Overload PT iOS application. The architecture aims for a scalable, maintainable, and testable codebase, leveraging modern Swift practices and Apple frameworks.

## Diagram

```mermaid
flowchart TD
    subgraph "Presentation Layer (SwiftUI)"
        direction LR
        V[Views (SwiftUI)]
        VM[ViewModels (@Observable)]
        V <--> VM
    end

    subgraph "Domain Layer"
        direction LR
        UC[Use Cases / Interactors]
        R[Repositories]
        M[Domain Models]
        VM --> UC
        UC --> R
        R <--> M
    end

    subgraph "Data Layer"
        direction LR
        DS[DataService (SwiftData + CloudKit)]
        NS[NetworkService (URLSession)]
        AIS[AICoachService (OpenAI API)]
        SD_Store[(SwiftData Local Store)]
        CK_DB[(CloudKit Private DB)]
        OpenAI_API[OpenAI API]

        R --> DS
        R --> NS
        DS --> SD_Store
        DS --> CK_DB
        NS --> AIS
        AIS --> OpenAI_API
    end

    %% Styling
    classDef presentation fill:#D6EAF8,stroke:#2E86C1,stroke-width:2px;
    classDef domain fill:#D1F2EB,stroke:#1ABC9C,stroke-width:2px;
    classDef data fill:#FCF3CF,stroke:#F1C40F,stroke-width:2px;

    class V,VM presentation;
    class UC,R,M domain;
    class DS,NS,AIS,SD_Store,CK_DB,OpenAI_API data;
```

## Layer Breakdown

1.  **Presentation Layer (SwiftUI):**
    *   **Views (`SwiftUI.View`):** Responsible for rendering the UI and capturing user input. Views are lightweight and declarative, reflecting the current state of the ViewModel.
    *   **ViewModels (`@Observable`):** Act as an intermediary between Views and the Domain Layer. They hold UI state, format data for display, and handle user actions by invoking Use Cases. They do *not* contain business logic.

2.  **Domain Layer:**
    *   **Use Cases/Interactors:** Encapsulate specific business logic and application-specific rules (e.g., `LogWorkoutUseCase`, `SuggestNextWeightUseCase`). They orchestrate data flow between ViewModels and Repositories. This promotes separation of concerns and testability.
    *   **Repositories (Protocols & Implementations):** Define contracts for data access operations (e.g., `WorkoutRepository`, `ExerciseRepository`). Concrete implementations interact with the Data Layer. This abstracts data sources from the rest of the app.
    *   **Domain Models:** Plain Swift structs/classes representing core business entities (e.g., `Exercise`, `WorkoutLog`, `UserPreferences`). These are independent of any specific framework.

3.  **Data Layer:**
    *   **DataService (`SwiftData` + `CloudKit`):** Manages persistence of user data. SwiftData handles local storage and schema, while CloudKit provides synchronization across user's devices and backup.
    *   **NetworkService (`URLSession`):** Handles all external API communication, primarily with the OpenAI API for the AI Coach feature. It will manage request/response serialization and error handling.
    *   **AICoachService:** A specialized service that sits on top of the NetworkService, specifically for interacting with the OpenAI API. It will handle prompt construction, parsing responses, and managing API keys securely.
    *   **Data Sources:**
        *   `SwiftData Local Store`: The on-device SQLite database managed by SwiftData.
        *   `CloudKit Private Database`: User's private iCloud database for syncing.
        *   `OpenAI API`: External service for AI capabilities.

## Key Architectural Decisions & Rationale

| Area | Choice | Rationale | Alternatives Considered |
|------|--------|-----------|-----------------------|
| **Overall Architecture** | **MVVM + Use Cases (Clean Architecture inspired)** | Clear separation of concerns, high testability, scalability. SwiftUI works naturally with MVVM. Use Cases isolate business logic. | Pure MVVM (ViewModels can become bloated), VIPER (can be overly complex for a solo dev project), MVC (less suitable for SwiftUI). |
| **UI Framework** | **SwiftUI 5 (latest stable)** | Native Apple framework, declarative syntax, strong integration with SwiftData and Combine/async-await. Best for modern iOS development. | UIKit (more imperative, older), React Native/Flutter (cross-platform, but adds complexity and potential performance overhead). |
| **Data Persistence** | **SwiftData with CloudKit Sync** | Native, declarative, integrates well with SwiftUI. CloudKit provides robust, free (within limits) sync and backup. Offline-first is a core benefit. | Core Data (more boilerplate, older API), Realm (third-party, good but adds dependency), Firebase Firestore (good real-time, but different ecosystem). |
| **Concurrency** | **Swift Concurrency (async/await)** | Modern, cleaner, and safer way to handle asynchronous operations compared to completion handlers or Combine for many tasks. | Combine (still useful for reactive streams, can be used alongside async/await), Grand Central Dispatch (lower-level). |
| **AI Integration** | **OpenAI GPT-4o via `openai-swift` (or direct URLSession)** | GPT-4o offers powerful conversational and reasoning capabilities. `openai-swift` simplifies API interaction. Direct URLSession for more control if needed. | Local LLMs (privacy benefits, but less powerful and more complex to manage on-device), other cloud AI providers (Vertex AI, Bedrock - could be options but OpenAI is well-suited for chat). |
| **Dependency Management** | **Swift Package Manager (SPM)** | Natively integrated into Xcode, easy to use, widely adopted. | CocoaPods (older, can be more complex), Carthage (less common now). |
| **Navigation** | **SwiftUI NavigationStack / `NavigationPath`** | Modern SwiftUI approach for programmatic and data-driven navigation. | Older `NavigationView` (less flexible), Coordinator pattern (can be useful for complex UIKit apps, less idiomatic for pure SwiftUI). |
| **Networking** | **`URLSession` with async/await** | Native, powerful, and integrates well with Swift Concurrency. | Alamofire (popular third-party, but `URLSession` is often sufficient now). |
| **Error Handling** | **Swift `Error` protocol, `Result` type, specific error enums** | Standard Swift patterns for robust error management. Clear error types for different layers. | Custom error classes, relying solely on optional returns (less informative). |
| **Logging** | **OSLog (`Logger`)** | Native Apple logging framework, efficient, and integrates with system logging tools (Console.app). | Third-party logging libraries (e.g., SwiftyBeaver - more features but adds dependency). |
| **CI/CD** | **GitHub Actions + fastlane** | Free for public/private repos (within limits), highly configurable. Fastlane automates iOS build/test/deploy tasks. | Bitrise, Jenkins, Xcode Cloud (Apple's own, good for simpler setups). |

## Modularity (Future Consideration)
While the initial version will be a single app target, the architecture is designed to allow for future modularization if the app grows in complexity. For example, the AI Coach or Progress Tracking features could potentially be extracted into separate Swift Packages.

## ADRs (Architectural Decision Records)
More detailed decisions and their context will be documented in `/docs/adr/` as they arise during development.

--- 
**Next action** → Proceed to update `03-data-model.md` based on the product spec and this architecture.