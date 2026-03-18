import SwiftUI

@MainActor
protocol SettingsRouter {
    func showDeleteAllHabitsAndCompletionsModal(
        onConfirmPressed: @escaping () -> Void,
        onCancelPressed: @escaping () -> Void
    )
    func dismissModal()
}

extension CoreRouter: SettingsRouter { }
