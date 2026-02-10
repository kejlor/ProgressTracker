import SwiftUI

@MainActor
protocol CreateHabitRouter {
    func dismissScreen()
}

extension CoreRouter: CreateHabitRouter { }
