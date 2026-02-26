//
//  HabitCompletionEntity.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 25/02/2026.
//

import SwiftUI
import SwiftData

@Model
final class HabitCompletionEntity {
    var id: UUID
    var habitId: UUID
    var date: Date
    
    init(habitId: UUID, date: Date) {
        self.id = UUID()
        self.habitId = habitId
        self.date = date
    }
}
