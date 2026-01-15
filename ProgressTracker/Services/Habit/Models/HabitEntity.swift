//
//  HabitEntity.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 15/01/2026.
//

import SwiftUI
import SwiftData

@Model
class HabitEntity {
    @Attribute(.unique) var habitId: String
    var selectedColor: String
    var days: Int
    var name: String
    var dateAdded: Date
    
    init(from model: HabitModel) {
        self.habitId = model.habitId
        self.selectedColor = model.selectedColor
        self.days = model.days
        self.name = model.name
        self.dateAdded = .now
    }
    
    func toModel() -> HabitModel {
        HabitModel(
            habitId: habitId,
            selectedColor: selectedColor,
            days: days,
            name: name
        )
    }
}
