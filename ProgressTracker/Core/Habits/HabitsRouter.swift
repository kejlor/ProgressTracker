import SwiftUI

@MainActor
protocol HabitsRouter {
    func showHabitDetailsView(habit: HabitModel)
    func showAddHabitView(onDisappear: @escaping () -> Void)
}

extension CoreRouter: HabitsRouter { }
