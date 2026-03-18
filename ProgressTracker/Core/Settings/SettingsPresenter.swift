import SwiftUI

@Observable
@MainActor
class SettingsPresenter {
    private let interactor: SettingsInteractor
    private let router: SettingsRouter
    
    init(
        interactor: SettingsInteractor,
        router: SettingsRouter
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    func onDeleteAllHabitsDataButtonPressed() {
        router.showDeleteAllHabitsAndCompletionsModal(
            onConfirmPressed: onConfirmDeleteAllHabitsAndHabitCompletionsPressed,
            onCancelPressed: onCancelDeletionPressed
        )
    }
    
    private func dismissModal() {
        router.dismissModal()
    }
    
    private func onCancelDeletionPressed() {
        dismissModal()
    }
    
    private func onConfirmDeleteAllHabitsAndHabitCompletionsPressed() {
        dismissModal()
        
        deleteAllHabits()
        deleteAllHabitCompletions()
    }
    
    private func deleteAllHabits() {
        do {
            try interactor.deleteAllHabits()
        } catch {
            print("Caught an error while deleting all habits")
        }
    }
    
    private func deleteAllHabitCompletions() {
        do {
            try interactor.deleteAllHabitCompletions()
        } catch {
            print("Caught an error while deleting all habit completins")
        }
    }
}
