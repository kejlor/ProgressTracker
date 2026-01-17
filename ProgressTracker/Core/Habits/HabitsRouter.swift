import SwiftUI

@MainActor
protocol HabitsRouter {
    func showHabitDetailsView(habit: HabitModel)
    func showAddHabitView()
}

extension CoreRouter: HabitsRouter { }
