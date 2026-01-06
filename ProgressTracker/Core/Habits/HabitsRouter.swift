import SwiftUI

@MainActor
protocol HabitsRouter {
    func showHabitDetailsView(props: HabitProps)
}

extension CoreRouter: HabitsRouter { }
