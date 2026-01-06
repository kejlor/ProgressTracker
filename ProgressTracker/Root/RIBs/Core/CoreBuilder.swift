import SwiftUI

@MainActor
struct CoreBuilder: Builder {
    let interactor: CoreInteractor
    
    func build() -> AnyView {
//        Text("Welcome in Progress Tracker")
//            .any()
        RouterView { router in
            habitsView(router: router)
        }
        .any()
    }
    
    func createHabitView(
        router: Router,
        props: HabitProps
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
                props: props
            )
        }
    }
    
    func habitsView(router: Router) -> some View {
        HabitsView(
            presenter: HabitsPresenter(
                interactor: interactor,
                router: CoreRouter(router: router, builder: self)
            ),
            habitView: { props in
                createHabitView(router: router, props: props)
            }
        )
    }
    
    func habitDetailsView(router: Router, props: HabitProps) -> some View {
        HabitDetailsView(
            presenter: HabitDetailsPresenter(
                interactor: interactor,
                router: CoreRouter(router: router, builder: self)
            ),
            props: props
        )
    }
}
