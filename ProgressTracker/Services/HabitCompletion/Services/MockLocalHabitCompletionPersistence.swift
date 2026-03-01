//
//  MockLocalHabitCompletionPersistence.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 01/03/2026.
//

import Foundation

struct MockLocalHabitCompletionPersistence: LocalHabitCompletionPersistence {
    func addHabitToCompletions(habit: HabitModel, date: Date) throws {
        
    }
    
    func getAllHabitCompletions() throws -> [HabitCompletionModel] {
        []
    }
    
    func getHabitCompletions(habit: HabitModel) throws -> [HabitCompletionModel] {
        []
    }
    
    func deleteHabitCompletion(habit: HabitModel, date: Date) throws {
        
    }
}
