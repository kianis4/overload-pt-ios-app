//
//  ExerciseSeeder.swift
//  OverloadPT
//
//  Created by Suleyman Kiani on 2025-06-12.
//


import Foundation
import SwiftData

@MainActor
enum ExerciseSeeder {
    static func run(container: ModelContainer) async throws {
        let context = container.mainContext
        // Only seed the very first time (no exercises exist)
        guard try context.fetch(FetchDescriptor<Exercise>()).isEmpty else { return }

        guard
            let url = Bundle.main.url(forResource: "Exercises", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let items = try? JSONDecoder().decode([SeedExercise].self, from: data)
        else { return }

        items.forEach { seed in
            context.insert(Exercise(name: seed.name, muscleGroup: seed.muscleGroup))
        }
        try context.save()
        print("Seeded \(items.count) exercises ✔︎")
    }

    private struct SeedExercise: Decodable {
        let name: String
        let muscle: String
        var muscleGroup: MuscleGroup { MuscleGroup(rawValue: muscle)! }
    }
}
