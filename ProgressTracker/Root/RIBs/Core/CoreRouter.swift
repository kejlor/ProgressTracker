import SwiftUI
import CustomRouting

typealias RouterView = CustomRouting.RouterView
typealias Router = CustomRouting.Router
typealias AlertType = CustomRouting.AlertType

@MainActor
struct CoreRouter: GlobalRouter {
    let router: Router
    let builder: CoreBuilder
    
    func showHabitsView() {
        router.showScreen(.push) { router in
            builder.habitsView(router: router)
        }
    }
    
    // TODO: Fix issues with navigation
    func showHabitDetailsView(habit: HabitModel) {
        router.showScreen(.push) { router in
            builder.habitDetailsView(router: router, habit: habit)
        }
    }
    
    func showAddHabitView(onDisappear: @escaping () -> Void) {
        router.showScreen(.sheet) { router in
            builder.createHabitView(router: router)
                .onDisappear(perform: onDisappear)
        }
    }
}
