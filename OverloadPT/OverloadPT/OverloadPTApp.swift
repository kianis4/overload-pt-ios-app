//
//  OverloadPTApp.swift
//  OverloadPT
//
//  Created by Suleyman Kiani on 2025-06-12.
//

// OverloadPTApp.swift  —  replace contents with:

import SwiftUI
import SwiftData

@main
struct OverloadPTApp: App {
    private let models: [any PersistentModel.Type] = [
        Exercise.self,
        WorkoutDay.self,
        SetEntry.self
    ]

    var body: some Scene {
        WindowGroup {
            RootView()      // or ContentView()
        }
        .modelContainer(for: models)   // single-line SwiftData setup
    }
}
