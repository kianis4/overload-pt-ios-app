//
//  TodayViewModel.swift
//  OverloadPT
//
//  Created by Suleyman Kiani on 2025-06-12.
//


import SwiftData
import Combine                     // ← because we use ObservableObject

@MainActor
final class TodayViewModel: ObservableObject {

    // MARK: - Dependencies
    private let context: ModelContext

    // MARK: - Published state
    @Published var sets: [SetEntry] = []

    // MARK: - Init
    init(context: ModelContext) {
        self.context = context
        fetchSets()
    }

    // MARK: - Intents
    func addDummySet() {
        guard
            let exercise = try? context.fetch(FetchDescriptor<Exercise>()).first
        else { return }

        let new = SetEntry(exercise: exercise, weight: 100, reps: 5)
        context.insert(new)
        try? context.save()
        fetchSets()
    }

    // MARK: - Private
    private func fetchSets() {
        sets = (try? context.fetch(FetchDescriptor<SetEntry>())) ?? []
    }
}
