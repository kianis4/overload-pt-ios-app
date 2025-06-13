//
//  Models.swift
//  OverloadPT
//
//  Created by Suleyman Kiani on 2025-06-12.
//


import Foundation
import SwiftData

@Model
final class Exercise {
    @Attribute(.unique) var id: UUID = UUID()   // ← change here
    var name: String
    var muscleGroup: MuscleGroup

    init(name: String, muscleGroup: MuscleGroup) {
        self.name = name
        self.muscleGroup = muscleGroup
    }
}

enum MuscleGroup: String, Codable, CaseIterable {
    case chest, back, legs, shoulders, arms, core
}

@Model
final class SetEntry {
    var exercise: Exercise
    var weight: Double
    var reps: Int
    var date: Date

    init(exercise: Exercise, weight: Double, reps: Int, date: Date = .now) {
        self.exercise = exercise
        self.weight = weight
        self.reps = reps
        self.date = date
    }
}

@Model
final class WorkoutDay {
    var date: Date
    var splitName: String
    var plannedExercises: [Exercise]
    var completedSets: [SetEntry]?

    init(date: Date = .now,
         splitName: String,
         plannedExercises: [Exercise] = [],
         completedSets: [SetEntry]? = nil) {
        self.date = date
        self.splitName = splitName
        self.plannedExercises = plannedExercises
        self.completedSets = completedSets
    }
}
