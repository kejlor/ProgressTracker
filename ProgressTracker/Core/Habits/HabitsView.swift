import SwiftUI

struct HabitsView<HabitView: View>: View {
    @State var presenter: HabitsPresenter
    @ViewBuilder var habitView: (HabitModel) -> HabitView
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        if presenter.habits.isEmpty {
            Text("Add your first habit!")
        } else {
            LazyVGrid(columns: columns) {
                ForEach(presenter.habits, id: \.habitId) { habit in
                    habitView(habit)
                        .anyButton(action: {
                            presenter.onHabitPressed(habit: habit)
                        })
                }
            }
            .padding()
        }
    }
}

#Preview {
    let container = DevPreview.shared.container
    let builder = CoreBuilder(interactor: CoreInteractor(container: container))
    
    return RouterView { router in
        builder.habitsView(router: router)
    }
}
