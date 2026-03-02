import SwiftUI

struct HabitDetailsView: View {
    @State var presenter: HabitDetailsPresenter
    
    var body: some View {
        VStack(spacing: 0) {
            editHabitNameSection
            deleteHabitButton
            previousDates
            updateHabitButton
        }
    }
}

private extension HabitDetailsView {
    private var editHabitNameSection: some View {
        VStack(spacing: 0) {
            Text("Edit habit name")
            TextField("Enter habit name", text: $presenter.habitNameText)
                .keyboardType(.alphabet)
                .autocorrectionDisabled()
                .accessibilityIdentifier("HabitTextField")
        }
    }
    
    private var updateHabitButton: some View {
        Button {
            presenter.onUpdatePressed()
        } label: {
            Text("Update habit")
        }
    }
    
    private var deleteHabitButton: some View {
        Button {
            presenter.onDeletePressed()
        } label: {
            Text("Delete habit")
        }
    }
    
    private func dateListView(date: Date) -> some View {
        HStack {
            Text(presenter.formatDate(date: date))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                presenter.habitCompletionButtonAction(date: date)
            } label: {
                Image(systemName: "checkmark.square.fill")
                    .foregroundStyle(presenter.hasCompletedHabit(at: date) ? presenter.currentHabitColor : .gray)
            }
        }
    }
    
    private var previousDates: some View {
        List {
            ForEach(presenter.previousDates, id: \.self) { previousDate in
                dateListView(date: previousDate)
                    .onAppear {
                        if presenter.isLastDate(date: previousDate) {
                            presenter.loadPreviousDates()
                        }
                    }
            }
        }
    }
}

#Preview {
    let container = DevPreview.shared.container
    let builder = CoreBuilder(interactor: CoreInteractor(container: container))
    
    return RouterView { router in
        builder
            .habitDetailsView(
                router: router,
                habit: HabitModel.mock,
                refetchData: { }
            )
    }
}
