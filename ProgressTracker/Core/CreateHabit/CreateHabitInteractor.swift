import SwiftUI

@MainActor
protocol CreateHabitInteractor {
    func addHabit(habit: HabitModel) throws
}

extension CoreInteractor: CreateHabitInteractor { }
