import SwiftUI

@MainActor
protocol HabitsRouter {
    func showHabitDetailsView(habit: HabitModel, refetchData: @escaping () -> Void)
    func showAddHabitView(onDisappear: @escaping () -> Void)
}

extension CoreRouter: HabitsRouter { }
