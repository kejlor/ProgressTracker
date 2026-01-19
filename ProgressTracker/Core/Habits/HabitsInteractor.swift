import SwiftUI

@MainActor
protocol HabitsInteractor {
    func getHabits() throws -> [HabitModel]
}

extension CoreInteractor: HabitsInteractor { }
