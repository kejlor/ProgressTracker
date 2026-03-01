//
//  HabitCompletionModel.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 25/02/2026.
//

import Foundation

struct HabitCompletionModel: Hashable, Codable {
    let id: UUID
    let habitId: UUID
    let date: Date
    
    init(
        id: UUID,
        habitId: UUID,
        date: Date
    ) {
        self.id = id
        self.habitId = habitId
        self.date = date
    }
    
    static func newHabitCompletion(habitId: UUID) -> Self {
        HabitCompletionModel(
            id: UUID(),
            habitId: habitId,
            date: Date.now
        )
    }
}
