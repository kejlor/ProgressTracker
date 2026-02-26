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
    
    // TODO: Fix issues with navigation
    func showHabitDetailsView(habit: HabitModel) {
        router.showScreen(.push, onDismiss: nil) { router in
            builder.habitDetailsView(router: router, habit: habit)
        }
    }
    
    func showAddHabitView(onDisappear: @escaping () -> Void) {
        router.showScreen(.push, onDismiss: onDisappear) { router in
            builder.createHabitView(router: router)
        }
    }
}
