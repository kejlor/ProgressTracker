//
//  LocalHabitPersistence.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 15/01/2026.
//

@MainActor
protocol LocalHabitPersistence {
    func addHabit(habit: HabitModel) throws
    func getHabits() throws -> [HabitModel]
    func removeHabit(habit: HabitModel) throws
    func updateHabit(habit: HabitModel) throws
    func deleteAllHabits() throws
}
