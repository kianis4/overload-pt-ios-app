//
//  ExerciseListView.swift
//  OverloadPT
//
//  Created by Suleyman Kiani on 2025-06-12.
//


import SwiftUI
import SwiftData

struct ExerciseListView: View {
    @Query(sort: \Exercise.name) private var exercises: [Exercise]

    var body: some View {
        NavigationStack {
            List(exercises) { exercise in
                NavigationLink(exercise.name) {
                    ExerciseDetailView(exercise: exercise)
                }
            }
            .navigationTitle("Exercises")
        }
    }
}

#Preview { ExerciseListView() }