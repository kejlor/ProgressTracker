import SwiftUI

// MARK: Temporary populating the view
struct StatisticsView: View {
    @State var presenter: StatisticsPresenter
    
    var body: some View {
        VStack(spacing: 0) {
            if presenter.completedHabits.isEmpty {
                emptyView
            } else {
                completedHabitsList
            }
        }
        .navigationTitle("Statistics")
        .toolbarTitleDisplayMode(.inlineLarge)
    }
}

private extension StatisticsView {
    private var emptyView: some View {
        Text("You did not complete any habit yet")
    }
    
    private var completedHabitsList: some View {
        List {
            ForEach(presenter.completedHabits, id: \.id) { completedHabit in
                // TODO: Add completed habit view implementation to statistics
                VStack {
                    Text("habit id: \(completedHabit.habitId)")
                        .bold()
                    Text("completed habit id: \(completedHabit.id)")
                }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
    }
}
#Preview {
    let container = DevPreview.shared.container
    let builder = CoreBuilder(interactor: CoreInteractor(container: container))
    
    return RouterView { router in
        builder.statisticsView(router: router)
    }
}
