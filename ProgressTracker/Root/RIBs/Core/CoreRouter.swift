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
    
    func showHabitDetailsView(props: HabitProps) {
        router.showScreen(.push) { router in
            builder.habitDetailsView(router: router, props: props)
        }
    }
}
