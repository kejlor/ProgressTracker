import SwiftUI

@MainActor
protocol CreateHabitRouter {
    func dismissScreen()
    func dismissModal()
}

extension CoreRouter: CreateHabitRouter { }
