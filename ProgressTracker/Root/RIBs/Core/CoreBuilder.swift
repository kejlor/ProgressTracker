import SwiftUI

@MainActor
struct CoreBuilder: Builder {
    let interactor: CoreInteractor
    
    func build() -> AnyView {
        tabBarView().any()
    }
    
    func tabBarView() -> some View {
        TabBarView(
            tabs: [
                TabBarScreen(
                    title: "Habits",
                    systemImage: "brain.head.profile",
                    screen: {
                        RouterView { router in
                            habitsView(router: router)
                        }
                        .any()
                    }
                ),
                TabBarScreen(
                    title: "Statistics",
                    systemImage: "chart.bar.xaxis",
                    screen: {
                        RouterView { router in
                            statisticsView(router: router)
                        }
                        .any()
                    }
                ),
                TabBarScreen(
                    title: "Settings",
                    systemImage: "gear",
                    screen: {
                        RouterView { router in
                            settingsView(router: router)
                        }
                        .any()
                    }
                )
            ]
        )
    }
    
    func createHabitView(
        router: Router,
        habit: HabitModel
    ) -> some View {
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
    
    func settingsView(router: Router) -> some View {
        SettingsView(
            presenter: SettingsPresenter(
                interactor: interactor,
                router: CoreRouter(router: router, builder: self)
            )
        )
    }
    
    func statisticsView(router: Router) -> some View {
        StatisticsView(
            presenter: StatisticsPresenter(
                interactor: interactor,
                router: CoreRouter(router: router, builder: self)
            )
        )
    }
}
