import SwiftUI

@MainActor
protocol HabitsInteractor {
    func addHabit(habit: HabitModel) throws
    func getHabits() throws -> [HabitModel]
}

extension CoreInteractor: HabitsInteractor { }
