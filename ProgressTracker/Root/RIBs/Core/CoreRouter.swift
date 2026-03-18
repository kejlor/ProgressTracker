import SwiftUI
import NavigationKit

typealias RouterView = NavigationKit.RouterView
typealias Router = NavigationKit.Router
typealias AlertType = NavigationKit.AlertType

@MainActor
struct CoreRouter: GlobalRouter {
    let router: Router
    let builder: CoreBuilder
    
    func showHabitsView() {
        router.showScreen(.push, onDismiss: nil) { router in
            builder.habitsView(router: router)
        }
    }
    
    func showHabitDetailsView(habit: HabitModel, refetchData: @escaping () -> Void) {
        router.showScreen(.push, onDismiss: nil) { router in
            builder
                .habitDetailsView(
                    router: router,
                    habit: habit,
                    refetchData: refetchData
                )
        }
    }
    
    func showAddHabitView(onDisappear: @escaping () -> Void) {
        router.showScreen(.sheet, onDismiss: onDisappear) { router in
            builder.createHabitView(router: router)
        }
    }
    
    func showSettingsView() {
        router.showScreen(.push, onDismiss: nil) { router in
            builder.settingsView(router: router)
        }
    }
    
    func showStatisticsView() {
        router.showScreen(.push, onDismiss: nil) { router in
            builder.statisticsView(router: router)
        }
    }
    
    // MARK: Modals
    func showDeleteAllHabitsAndCompletionsModal(
        onConfirmPressed: @escaping () -> Void,
        onCancelPressed: @escaping () -> Void
    ) {
        router.showModal(
            transition: .move(edge: .bottom),
            backgroundColor: .black.opacity(0.5),
            destination: {
                CustomModalView(
                    title: "Delete all data related to habits and their completions.",
                    subtitle: "This action cannot be undone.",
                    primaryButtonTitle: "Confirm",
                    primaryButtonAction: onConfirmPressed,
                    secondaryButtonTitle: "Cancel",
                    secondaryButtonAction: onCancelPressed
                )
        })
    }
    
    func dismissModal() {
        router.dismissModal()
    }
}
