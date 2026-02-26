import SwiftUI

@MainActor
struct CoreInteractor {
    private let habitManager: HabitManager
    
    init(container: DependencyContainer) {
        let localHabitService = container.resolve(LocalHabitPersistence.self)!
        self.habitManager = HabitManager(local: localHabitService)
    }
    
    // MARK: AvatarManager
    func addHabit(habit: HabitModel) throws {
        try habitManager.addHabit(habit: habit)
    }
    
    func getHabits() throws -> [HabitModel] {
        try habitManager.getHabits()
    }
}
