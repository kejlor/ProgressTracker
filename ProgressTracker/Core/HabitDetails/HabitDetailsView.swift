import SwiftUI

struct HabitDetailsView: View {
    @State var presenter: HabitDetailsPresenter
    
    var body: some View {
        VStack(spacing: 0) {
            editHabitNameSection
            previousDates
        }
        .padding(.horizontal, 16)
        .toolbar {
            ToolbarItem(placement: .principal) {
                screenTitle
            }
            
            ToolbarItem(placement: .destructiveAction) {
                deleteButton
            }
            
            ToolbarItem(placement: .confirmationAction) {
                updateButton
            }
        }
    }
}

private extension HabitDetailsView {
    var updateButton: some View {
        Button("Update", systemImage: "checkmark.circle.fill") {
            presenter.onUpdatePressed()
        }
    }
    
    var screenTitle: some View {
        Text("Details view")
    }
    
    var deleteButton: some View {
        Button("Delete", systemImage: "trash") {
            presenter.onDeletePressed()
        }
        .tint(.red)
    }
    
    private var editHabitNameSection: some View {
        VStack(alignment: .leading) {
            Text("Habit name")
            TextField("Enter habit name", text: $presenter.habitNameText)
                .keyboardType(.alphabet)
                .autocorrectionDisabled()
                .accessibilityIdentifier("HabitTextField")
                .textFieldStyle(.roundedRectangleTextFieldStyle)
        }
        .padding(.bottom, 8)
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
        VStack(alignment: .leading) {
            Text("Previous dates")
            
            List {
                ForEach(presenter.previousDates, id: \.self) { previousDate in
                    dateListView(date: previousDate)
                }
            }
            .ignoresSafeArea()
            .listStyle(PlainListStyle())
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
