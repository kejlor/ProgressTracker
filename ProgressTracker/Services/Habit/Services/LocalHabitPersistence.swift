//
//  LocalHabitPersistence.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 15/01/2026.
//

import Foundation

@MainActor
protocol LocalHabitPersistence {
    func addHabit(habit: HabitModel) throws
    func getHabits() throws -> [HabitModel]
    func removeHabit(habit: HabitModel) throws
    func updateHabit(habit: HabitModel) throws
    func addHabitToCompletions(habit: HabitModel, date: Date) throws
    func getHabitCompletions(habit: HabitModel) throws -> [HabitCompletionModel]
    func deleteHabitCompletion(habit: HabitModel, date: Date) throws
}
