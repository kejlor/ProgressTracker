import SwiftUI

@MainActor
struct CoreInteractor {
    private let habitManager: HabitManager
    
    init(container: DependencyContainer) {
        let localHabitService = container.resolve(LocalHabitPersistence.self)!
        self.habitManager = HabitManager(local: localHabitService)
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
        try habitManager.addHabitToCompletions(habit: habit, date: date)
    }
    
    func getHabitCompletions(habit: HabitModel) throws -> [HabitCompletionModel] {
        try habitManager.getHabitCompletions(habit: habit)
    }
    
    func deleteHabitCompletion(habit: HabitModel, date: Date) throws {
        try habitManager.deleteHabitCompletion(habit: habit, date: date)
    }
}
