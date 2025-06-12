<!-- filepath: /Users/suley/Desktop/github/overload-pt-ios-app/docs/CONTRIBUTING.md -->
# Contributing to Overload PT

Thank you for your interest in contributing to Overload PT! As this is currently a solo-developed project, the contribution process is streamlined. However, following these guidelines will help maintain code quality and project organization.

## Getting Started

1.  **Ensure you have the necessary tools:**
    *   Xcode (latest stable version, as specified in `README.md` or project settings).
    *   SwiftLint (`brew install swiftlint` if you use Homebrew).
    *   An understanding of the project's goals and architecture (see `docs/` folder, especially `01-spec.md` and `02-architecture.md`).

2.  **Fork the repository (if you are an external contributor in the future).**
    *   For now, as the primary developer, you'll work on branches within the main repository.

3.  **Clone your fork/repository:**
    ```bash
    git clone git@github.com:kianis4/overload-pt-ios-app.git
    cd overload-pt-ios-app
    ```

## Development Process

1.  **Branching Strategy:**
    *   All development work should be done on feature branches.
    *   Branch off the `develop` branch (or `main` if `develop` doesn't exist yet - for now, assume `main` is the primary development line until a more formal git-flow is established).
    *   **Branch Naming:** Use a descriptive naming convention, prefixed with `feature/`, `fix/`, `docs/`, `chore/`, etc.
        *   Example: `feature/workout-logging` or `fix/calendar-sync-issue`
        ```bash
        # Assuming main is the development branch for now
        git checkout main
        git pull
        git checkout -b feature/your-feature-name
        ```

2.  **Making Changes:**
    *   Write clean, readable, and maintainable Swift code.
    *   Follow the coding style outlined below.
    *   Ensure your changes align with the project architecture and product specification.

3.  **Code Style & Linting:**
    *   **Indentation:** 2 spaces.
    *   **Trailing Commas:** Allowed and encouraged where appropriate (e.g., in multi-line array/dictionary literals).
    *   **Concurrency:** Prefer `async/await` for new asynchronous code.
    *   **SwiftLint:** Run `swiftlint` from the project root before committing to catch style violations and potential errors.
        ```bash
        swiftlint
        ```
        *   Ensure SwiftLint passes without errors or warnings (or address them appropriately).
    *   **Comments:** Add comments to explain complex logic or non-obvious decisions.

4.  **Testing:**
    *   **Unit Tests:** For new business logic, data transformations, or utility functions, add corresponding unit tests in `OverloadPTTests/`.
    *   **UI Tests:** For significant UI changes or new user flows, consider adding UI tests in `OverloadPTUITests/`.
    *   Aim to maintain or increase the test coverage (target: ≥80% unit, ≥70% UI as per `01-spec.md`).
    *   Run tests locally before pushing changes:
        ```bash
        # In Xcode: Product > Test (Cmd+U)
        ```

5.  **Commit Messages:**
    *   Follow the **Conventional Commits** specification (https://www.conventionalcommits.org/).
    *   Format: `<type>[optional scope]: <description>`
    *   Examples:
        *   `feat: implement set logging in workout view`
        *   `fix(datamodel): correct relationship between Exercise and SetEntry`
        *   `docs: update roadmap with new sprint details`
        *   `style: apply swiftlint fixes to ViewModel layer`
        *   `refactor: simplify progress chart data aggregation`
        *   `test: add unit tests for Epley 1RM calculation`

6.  **Pushing Changes:**
    *   Push your feature branch to the remote repository.
        ```bash
        git push origin feature/your-feature-name
        ```

7.  **Opening a Pull Request (PR):**
    *   Open a PR from your feature branch to the `main` (or `develop`) branch.
    *   Provide a clear title and description for your PR, outlining the changes made and referencing any relevant issues or documentation.
    *   Ensure all automated checks (CI via GitHub Actions, including SwiftLint) pass.

8.  **Code Review (Self-Review for Solo Dev):**
    *   Even as a solo developer, take the time to review your own PR. Look for potential issues, areas for improvement, or missed requirements.
    *   Check that all acceptance criteria for the feature/fix are met.

9.  **Merging:**
    *   Once the PR is approved (by yourself, after careful review) and all checks pass, merge it into the target branch.
    *   Prefer **squash and merge** to keep the commit history clean on the main development line. This combines all commits from the feature branch into a single commit on merge.

## Project Structure
Familiarize yourself with the project structure outlined in the `README.md` and the workspace itself. Key areas:
*   `OverloadPT/OverloadPT/`: Main application source code.
*   `OverloadPT/OverloadPTTests/`: Unit tests.
*   `OverloadPT/OverloadPTUITests/`: UI tests.
*   `docs/`: All project documentation.

## Communication
As a solo developer, primary communication is through commit messages, PR descriptions, and updating documentation. If questions arise that require external input, use appropriate forums or research channels.

By following these guidelines, we can ensure Overload PT is built with a high standard of quality and maintainability.

---
**Next action** → Update `README.md`.