import SwiftUI

struct HabitsView<HabitView: View>: View {
    @State var presenter: HabitsPresenter
    @ViewBuilder var habitView: (HabitModel) -> HabitView
    
    var body: some View {
        VStack(spacing: 0) {
            if presenter.habits.isEmpty {
                emptyView
            } else {
                habitsList
            }
        }
        .navigationTitle("Habits")
        .toolbarTitleDisplayMode(.inlineLarge)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                addHabitButton
            }
        }
    }
}

private extension HabitsView {
    private var emptyView: some View {
        Text("Add your first habit!")
    }
    
    private var habitsList: some View {
        List {
            ForEach(presenter.habits, id: \.id) { habit in
                habitView(habit)
                    .anyButton(action: {
                        presenter.onHabitPressed(habit: habit)
                    })
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
    }
    
    private var addHabitButton: some View {
        Button {
            presenter.onAddHabitPressed(onDisappear: { presenter.getHabits() })
        } label: {
            VStack(spacing: 0) {
                Image(systemName: "plus.square.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                Text("Add")
            }
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
