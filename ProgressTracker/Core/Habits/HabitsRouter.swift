import SwiftUI

@MainActor
protocol HabitsRouter {
    func showHabitDetailsView(habit: HabitModel)
}

extension CoreRouter: HabitsRouter { }
