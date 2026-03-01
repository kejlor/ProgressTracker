import SwiftUI

@MainActor
struct CoreInteractor {
    private let habitManager: HabitManager
    private let habitCompletionManager: HabitCompletionManager
    
    init(container: DependencyContainer) {
        self.habitManager = container.resolve(HabitManager.self)!
        self.habitCompletionManager = container.resolve(HabitCompletionManager.self)!
    }
    
    func addHabit(habit: HabitModel) throws {
        try habitManager.addHabit(habit: habit)
    }
    
    func getHabits() throws -> [HabitModel] {
        try habitManager.getHabits()
    }
    
    func removeHabit(habit: HabitModel) throws {
        try habitManager.removeHabit(habit: habit)
    }
    
    func updateHabit(habit: HabitModel) throws {
        try habitManager.updateHabit(habit: habit)
    }
    
    func addHabitToCompletions(habit: HabitModel, date: Date) throws {
        try habitCompletionManager.addHabitToCompletions(habit: habit, date: date)
    }
    
    func getAllHabitCompletions() throws -> [HabitCompletionModel] {
        try habitCompletionManager.getAllHabitCompletions()
    }
    
    func getHabitCompletions(habit: HabitModel) throws -> [HabitCompletionModel] {
        try habitCompletionManager.getHabitCompletions(habit: habit)
    }
    
    func deleteHabitCompletion(habit: HabitModel, date: Date) throws {
        try habitCompletionManager.deleteHabitCompletion(habit: habit, date: date)
    }
}
