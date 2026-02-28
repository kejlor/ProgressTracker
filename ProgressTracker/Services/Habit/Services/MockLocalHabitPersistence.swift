//
//  MockLocalHabitPersistence.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 15/01/2026.
//

import Foundation

struct MockLocalHabitPersistence: LocalHabitPersistence {
    let habits: [HabitModel]
    
    init(habits: [HabitModel] = HabitModel.mocks) {
        self.habits = habits
    }
    
    func addHabit(habit: HabitModel) throws {
        
    }
    
    func getHabits() throws -> [HabitModel] {
        habits
    }
    
    func removeHabit(habit: HabitModel) throws {
        
    }
    
    func updateHabit(habit: HabitModel) throws {
        
    }
    
    func addHabitToCompletions(habit: HabitModel, date: Date) throws {
        
    }
    
    func getHabitCompletions(habit: HabitModel) throws -> [HabitCompletionModel] {
        []
    }
    
    func deleteHabitCompletion(habit: HabitModel, date: Date) throws {
        
    }
}
