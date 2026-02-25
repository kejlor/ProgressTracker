import SwiftUI

@MainActor
struct CoreBuilder: Builder {
    let interactor: CoreInteractor
    
    func build() -> AnyView {
        RouterView { router in
            habitsView(router: router)
        }
        .any()
    }
    
    func createHabitView(
        router: Router,
        habit: HabitModel
    ) -> some View {
        RouterView { router in
            HabitView(
                presenter: HabitPresenter(
                    interactor: interactor,
                    router: CoreRouter(
                        router: router,
                        builder: self
                    )
                ),
                habit: habit
            )
        }
    }
    
    func habitsView(router: Router) -> some View {
        HabitsView(
            presenter: HabitsPresenter(
                interactor: interactor,
                router: CoreRouter(router: router, builder: self)
            ),
            habitView: { habit in
                createHabitView(router: router, habit: habit)
            }
        )
    }
    
    func habitDetailsView(router: Router, habit: HabitModel) -> some View {
        HabitDetailsView(
            presenter: HabitDetailsPresenter(
                interactor: interactor,
                router: CoreRouter(router: router, builder: self),
                habit: habit
            )
        )
    }
}
