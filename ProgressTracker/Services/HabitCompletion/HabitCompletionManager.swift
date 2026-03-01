//
//  HabitCompletionManager.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 01/03/2026.
//

import SwiftUI

@MainActor
@Observable
class HabitCompletionManager {
    private let local: LocalHabitCompletionPersistence
    
    init(local: LocalHabitCompletionPersistence) {
        self.local = local
    }
    
    func addHabitToCompletions(habit: HabitModel, date: Date) throws {
        try local.addHabitToCompletions(habit: habit, date: date)
    }
    
    func getAllHabitCompletions() throws -> [HabitCompletionModel] {
        try local.getAllHabitCompletions()
    }
    
    func getHabitCompletions(habit: HabitModel) throws -> [HabitCompletionModel] {
        try local.getHabitCompletions(habit: habit)
    }
    
    func deleteHabitCompletion(habit: HabitModel, date: Date) throws {
        try local.deleteHabitCompletion(habit: habit, date: date)
    }
}
