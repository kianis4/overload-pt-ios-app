
//
//  UserPreferences.swift
//  OverloadPT
//
//  Created by GitHub Copilot on 2025-06-12.
//

import SwiftData
import Foundation

// Enum for weight units, as defined in 03-data-model.md
enum WeightUnit: String, Codable, CaseIterable, Identifiable {
    case kilograms = "kg"
    case pounds = "lbs"
    var id: String { self.rawValue }
}

@Model
final class UserPreferences {
    @Attribute(.unique) var id: String = "singleton" // Use a fixed ID for a single preferences object
    var weightUnit: WeightUnit = .kilograms
    var lastSyncDate: Date?
    var healthKitBodyweightEnabled: Bool = false
    // Add other preferences as needed

    init(id: String = "singleton", weightUnit: WeightUnit = .kilograms, lastSyncDate: Date? = nil, healthKitBodyweightEnabled: Bool = false) {
        self.id = id
        self.weightUnit = weightUnit
        self.lastSyncDate = lastSyncDate
        self.healthKitBodyweightEnabled = healthKitBodyweightEnabled
    }
}
