//
//  HabitCompletionModel.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 25/02/2026.
//

import Foundation

struct HabitCompletionModel: Hashable, Codable {
    let habitId: UUID
    let date: Date
    
    init(
        habitId: UUID,
        date: Date
    ) {
        self.habitId = habitId
        self.date = date
    }
    
    static func newHabitCompletion(habitId: UUID) -> Self {
        HabitCompletionModel(
            habitId: habitId,
            date: Date.now
        )
    }
}
