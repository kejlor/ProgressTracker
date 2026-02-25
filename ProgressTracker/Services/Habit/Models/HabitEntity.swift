//
//  HabitEntity.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 15/01/2026.
//

import SwiftUI
import SwiftData

@Model
final class HabitEntity {
    @Attribute(.unique) var id: UUID
    var habitColorHex: String
    var days: Int
    var name: String
    var dateAdded: Date
    
    init(from model: HabitModel) {
        self.id = model.id
        self.habitColorHex = model.habitColorHex
        self.days = model.days
        self.name = model.name
        self.dateAdded = .now
    }
    
    func toModel() -> HabitModel {
        HabitModel(
            id: id,
            habitColorHex: habitColorHex,
            days: days,
            name: name
        )
    }
}
