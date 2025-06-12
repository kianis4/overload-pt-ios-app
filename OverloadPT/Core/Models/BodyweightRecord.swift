
//
//  BodyweightRecord.swift
//  OverloadPT
//
//  Created by GitHub Copilot on 2025-06-12.
//

import SwiftData
import Foundation

@Model
final class BodyweightRecord {
    @Attribute(.unique) var id: UUID
    var date: Date
    var weight: Double // In user's preferred unit, consistent with UserPreferences.weightUnit

    init(id: UUID = .init(), date: Date, weight: Double) {
        self.id = id
        self.date = date
        self.weight = weight
    }
}
