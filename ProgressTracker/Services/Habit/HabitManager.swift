//
//  HabitManager.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 15/01/2026.
//

import SwiftUI

@MainActor
@Observable
class HabitManager {
    private let local: LocalHabitPersistence
    
    init(
        local: LocalHabitPersistence
    ) {
        self.local = local
    }
    
    func addHabit(habit: HabitModel) throws {
        try local.addHabit(habit: habit)
    }
    
    func getHabits() throws -> [HabitModel] {
        try local.getHabits()
    }
}
