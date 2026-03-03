import SwiftUI

@MainActor
protocol HabitInteractor {
    func updateHabit(habit: HabitModel) throws
    func addHabitToCompletions(habit: HabitModel, date: Date) throws
    func getHabitCompletions(habit: HabitModel) throws -> [HabitCompletionModel]
}

extension CoreInteractor: HabitInteractor { }
