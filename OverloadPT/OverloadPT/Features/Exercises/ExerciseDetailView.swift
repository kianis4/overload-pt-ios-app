//
//  ExerciseDetailView.swift
//  OverloadPT
//
//  Created by Suleyman Kiani on 2025-06-12.
//


import SwiftUI

struct ExerciseDetailView: View {
    let exercise: Exercise
    var body: some View {
        Text("Details for \(exercise.name)")
            .font(.title2)
            .navigationTitle(exercise.name)
    }
}

#Preview {
    // fake preview
    ExerciseDetailView(exercise: Exercise(name: "Demo", muscleGroup: .chest))
}
