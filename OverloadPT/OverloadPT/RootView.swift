//
//  RootView.swift
//  OverloadPT
//
//  Created by Suleyman Kiani on 2025-06-12.
//


import SwiftUI
import SwiftData

struct RootView: View {
    @Environment(\.modelContext) private var context

    var body: some View {
        TabView {
            NavigationStack { TodayView(context: context) }
                .tabItem { Label("Today", systemImage: "calendar") }

            NavigationStack { WorkoutSplitsView() }
                .tabItem { Label("Splits", systemImage: "square.grid.3x3") }

            NavigationStack { ExerciseListView() }
                .tabItem { Label("Exercises", systemImage: "list.bullet") }

            NavigationStack { ProgressView() }
                .tabItem { Label("Progress", systemImage: "chart.line.uptrend.xyaxis") }

            NavigationStack { AICoachView() }
                .tabItem { Label("AI Coach", systemImage: "brain") }

            NavigationStack { SettingsView() }
                .tabItem { Label("Settings", systemImage: "gearshape") }
        }
        .task {               // ensure seed runs once per launch
            try? await ExerciseSeeder.run(container: context.container)
        }
    }
}
