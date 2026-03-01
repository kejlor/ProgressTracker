import SwiftUI

@MainActor
protocol HabitDetailsInteractor {
    func getHabitCompletions(habit: HabitModel) throws -> [HabitCompletionModel]
    func addHabitToCompletions(habit: HabitModel, date: Date) throws
    func deleteHabitCompletion(habit: HabitModel, date: Date) throws
}

extension CoreInteractor: HabitDetailsInteractor { }
