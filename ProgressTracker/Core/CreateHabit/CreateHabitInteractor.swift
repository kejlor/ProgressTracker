import SwiftUI

@MainActor
protocol CreateHabitInteractor {
    func addHabit(habit: HabitModel) throws
    func getHabits() throws -> [HabitModel]
}

extension CoreInteractor: CreateHabitInteractor { }
