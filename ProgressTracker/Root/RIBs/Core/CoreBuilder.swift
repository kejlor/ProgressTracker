import SwiftUI

@MainActor
struct CoreBuilder: Builder {
    let interactor: CoreInteractor
    
    func build() -> AnyView {
        Text("Welcome in Progress Tracker")
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
}
