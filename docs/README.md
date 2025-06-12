<!-- filepath: /Users/suley/Desktop/github/overload-pt-ios-app/docs/README.md -->
# Overload PT: AI-Powered Progressive Overload Tracker for iOS

**Overload PT** is an iOS application meticulously designed for lifters who are serious about making consistent, data-driven progress. It combines intuitive workout planning and tracking with an intelligent AI coach to take the guesswork out of progressive overload.

| Build & Quality                                       | Documentation Central                                   |
| :---------------------------------------------------- | :------------------------------------------------------ |
| ![CI/CD Status](https://img.shields.io/badge/CI/CD-GitHub_Actions_%26_fastlane-blueviolet) | [![Project Spec](https://img.shields.io/badge/📄%20Specification-01--spec.md-blue)](docs/01-spec.md) |
| ![Swift Version](https://img.shields.io/badge/Swift-6-orange) | [![Architecture](https://img.shields.io/badge/🏗%20Architecture-02--architecture.md-blue)](docs/02-architecture.md) |
| ![UI Framework](https://img.shields.io/badge/UI-SwiftUI_5-cyan) | [![Data Model](https://img.shields.io/badge/💾%20Data%20Model-03--data--model.md-blue)](docs/03-data-model.md) |
| ![Test Coverage](https://img.shields.io/badge/Coverage 목표-≥80%25_Unit,_≥70%25_UI-green) | [![AI API](https://img.shields.io/badge/🤖%20AI%20API-04--ai--api.md-blue)](docs/04-ai-api.md) |
| ![Project Status](https://img.shields.io/badge/Status-Sprint%200%20(Setup%20%26%20Docs)-lightgrey) | [![Roadmap](https://img.shields.io/badge/🗺%20Roadmap-05--roadmap.md-blue)](docs/05-roadmap.md) |

---

## ✨ Core Idea & Vision

Overload PT empowers users to:

1.  **Build & Customize Workout Splits:** Design detailed training programs (e.g., Push/Pull/Legs, Upper/Lower) with specific exercises, sets, and rep targets.
2.  **Schedule & Plan:** Assign workout days to an intuitive in-app calendar.
3.  **Log Workouts with Precision:** Track weight, reps, and Rate of Perceived Exertion (RPE) for every set, ensuring accurate performance data.
4.  **Visualize Progress:** Monitor key metrics like estimated 1-Rep Max (E1RM) and total training volume through clear, insightful charts.
5.  **Leverage AI Coaching:** Get personalized suggestions for weight/rep increments and answers to training questions from an OpenAI GPT-4o powered coach.

The vision is to create an indispensable tool for lifters that simplifies the application of progressive overload, fostering consistent gains and a deeper understanding of their training.

## 🚀 Key Features (MVP)

*   **Intuitive Split Builder:** Create, customize, and manage multiple workout splits and training days.
*   **Comprehensive Exercise Database:** Pre-loaded exercises with the ability for users to add their own.
*   **Calendar-Based Scheduling:** Plan your workouts visually and see your training week at a glance.
*   **Detailed Workout Logger:** Log sets, reps, weight, RPE, and rest times with ease. Offline-first functionality.
*   **Dynamic Progress Charts:** Track E1RM, volume, and bodyweight trends using `SwiftUI.Chart`.
*   **AI Coach:** Integrated chat for OpenAI GPT-4o to suggest next-step progressions and answer training queries.
*   **SwiftData & CloudKit Sync:** Seamless data persistence and synchronization across user's iCloud devices.
*   **HealthKit Integration:** Optionally sync bodyweight data.
*   **Accessibility:** Support for VoiceOver and Dynamic Type.

## 🛠 Tech Stack & Architectural Highlights

This project is a showcase of modern iOS development practices:

*   **Language:** Swift 6 (leveraging modern concurrency with `async/await`)
*   **UI:** SwiftUI 5 (declarative, responsive, and accessible UI)
*   **Persistence:** SwiftData with CloudKit (native, declarative data management and cloud sync)
*   **Architecture:** MVVM + Use Cases (Clean Architecture inspired), promoting separation of concerns, testability, and scalability. (See [`docs/02-architecture.md`](docs/02-architecture.md))
*   **AI:** OpenAI GPT-4o integrated via a dedicated service layer, using `openai-swift` or direct `URLSession` calls.
*   **Charting:** Native `SwiftUI.Chart` for beautiful and efficient data visualization.
*   **CI/CD:** GitHub Actions with `fastlane` for automated linting, testing, and build processes.
*   **Testing:** Rigorous unit and UI testing (XCTest) with a target of ≥80% unit and ≥70% UI coverage.
*   **Linting:** SwiftLint for maintaining code consistency and quality.

## 🎯 Project Status

**Current Phase:** Sprint 0 - Foundation & Documentation (as of June 12, 2025).

The project is in its initial setup phase, focusing on establishing a solid foundation through comprehensive documentation and setting up the development environment and CI/CD pipeline.

Follow the progress via the [Project Roadmap](docs/05-roadmap.md).

## 👨‍💻 For Developers & Recruiters

Overload PT serves as a practical example of building a feature-rich iOS application using the latest Apple technologies and industry best practices. Key aspects that might be of interest:

*   **Modern Swift & SwiftUI:** Demonstrates proficiency in Swift 6, SwiftUI 5, and Swift Concurrency.
*   **SwiftData Expertise:** In-depth use of SwiftData for local persistence and CloudKit for synchronization.
*   **Clean Architecture Principles:** Application of architectural patterns that lead to a maintainable, scalable, and testable codebase.
*   **AI Integration:** Practical implementation of OpenAI's GPT models for a real-world use case.
*   **Full Development Lifecycle:** The project will cover the entire app development process, from ideation and detailed specification to UI/UX design, development, testing, and (simulated) deployment.
*   **Attention to Detail:** Focus on non-functional requirements like offline-first support, accessibility, and robust error handling.

## 🏃 Quick Start (Development)

1.  **Clone the repository:**
    ```bash
    git clone git@github.com:kianis4/overload-pt-ios-app.git
    cd overload-pt-ios-app
    ```
2.  **Open the project in Xcode:**
    ```bash
    open OverloadPT/OverloadPT.xcodeproj
    ```
    *(Requires Xcode 16+ or the version specified in project settings)*

3.  **Install SwiftLint (if not already installed):**
    ```bash
    brew install swiftlint 
    ```
4.  **Run SwiftLint (optional, but recommended before committing):**
    ```bash
    swiftlint
    ```
5.  Build and run the app on a simulator or device (Cmd+R).

## 📂 Project Structure Overview

```
docs/                       # All project documentation (markdown files)
OverloadPT/
├── OverloadPT/             # Main application source code (SwiftUI Views, ViewModels, Models, Services etc.)
│   ├── App/                # App delegate, main app struct
│   ├── Core/               # Core components (e.g., SwiftData stack, AI Service)
│   ├── Features/           # Feature-specific modules (e.g., WorkoutLogging, ProgressView)
│   ├── Models/             # SwiftData Models (see 03-data-model.md)
│   ├── Utils/              # Utility functions, extensions
│   └── Resources/          # Assets, etc.
├── OverloadPT.xcodeproj    # Xcode project file
├── OverloadPTTests/        # Unit tests
└── OverloadPTUITests/      # UI tests
```
*(Note: The internal structure of `OverloadPT/OverloadPT/` will evolve as development progresses.)*

## 📚 Key Documentation (Navigation Hub)

This repository uses a documentation-driven approach. Please refer to the following key documents for detailed information:

*   [`docs/01-spec.md`](docs/01-spec.md): **Product Specification** – Detailed vision, personas, use cases, screen breakdowns, and NFRs.
*   [`docs/02-architecture.md`](docs/02-architecture.md): **Software Architecture** – System architecture, layer diagrams, and key architectural decisions.
*   [`docs/03-data-model.md`](docs/03-data-model.md): **Data Model** – SwiftData entity definitions, relationships, and ERD.
*   [`docs/04-ai-api.md`](docs/04-ai-api.md): **AI Coach API Contract** – OpenAI integration details, prompts, and expected responses.
*   [`docs/05-roadmap.md`](docs/05-roadmap.md): **Project Roadmap** – Sprint plan, key deliverables, and timelines.
*   [`docs/CONTRIBUTING.md`](docs/CONTRIBUTING.md): **Contribution Guidelines** – Branching strategy, code style, commit conventions, and PR process.

## 🤝 Contributing

Currently, this is a solo development project. However, the [CONTRIBUTING.md](docs/CONTRIBUTING.md) file outlines the process and standards for development, which are being followed to ensure high quality.

## 📄 License

This project is licensed under the MIT License - see the `LICENSE` file for details (to be added).
