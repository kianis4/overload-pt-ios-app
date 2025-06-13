//
//  TodayView.swift
//  OverloadPT
//
//  Created by Suleyman Kiani on 2025-06-12.
//


import SwiftUI
import SwiftData

struct TodayView: View {
    @Environment(\.modelContext) private var context
    @StateObject private var vm: TodayViewModel

    // inject context with a custom init
    init(context: ModelContext) {
        _vm = StateObject(wrappedValue: TodayViewModel(context: context))
    }

    var body: some View {
        List {
            ForEach(vm.sets, id: \.self) { set in
                Text("\(set.exercise.name) \(set.weight)×\(set.reps)")
            }
            Button("Add Set") { vm.addDummySet() }
        }
        .navigationTitle("Today")
    }
}

#Preview {
    TodayPreview()          // ⬅︎ single-line View expression ✅
}

private struct TodayPreview: View {
    // PREVIEW-ONLY state
    private let container: ModelContainer
    private let ctx: ModelContext

    init() {
        // 1️⃣ In-memory container
        container = try! ModelContainer(
            for: Exercise.self, SetEntry.self, WorkoutDay.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        // 2️⃣ Seed one exercise
        ctx = container.mainContext
        ctx.insert(Exercise(name: "Bench Press", muscleGroup: .chest))
    }

    var body: some View {
        TodayView(context: ctx)
            .modelContainer(container)   // ⬅︎ preview renders with data
    }
}
