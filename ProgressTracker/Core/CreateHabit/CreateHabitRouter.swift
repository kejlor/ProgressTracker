import SwiftUI

@MainActor
protocol CreateHabitRouter {
//    func dismissModal()
    func dismissScreen()
}

extension CoreRouter: CreateHabitRouter { }
