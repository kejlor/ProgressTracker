import SwiftUI

@MainActor
protocol HabitDetailsRouter {
    func dismissScreen()
}

extension CoreRouter: HabitDetailsRouter { }
