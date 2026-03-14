import SwiftUI

struct CreateHabitView: View {
    @State var presenter: CreateHabitPresenter
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                textFieldSection
                selectStartDate
                colorGrid
                    .padding(.horizontal, 24)
            }
            .animation(.bouncy, value: presenter.selectedColor)
        }
        .padding(.horizontal, 16)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Add", systemImage: "checkmark.circle.fill") {
                    presenter.onAddPressed()
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text("Add new habit")
            }
            
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel", systemImage: "xmark.circle.fill") {
                    presenter.onCancelPressed()
                }
            }
        }
    }
}

private extension CreateHabitView {
    var textFieldSection: some View {
        VStack(alignment: .leading) {
            Text("Enter habit name")
            
            TextField("", text: $presenter.habitNameText)
                .keyboardType(.alphabet)
                .autocorrectionDisabled()
                .accessibilityIdentifier("HabitTextField")
                .textFieldStyle(.roundedRectangleTextFieldStyle)
        }
    }
    
    var selectStartDate: some View {
        DatePicker(
            "Select start date",
            selection: $presenter.startDate,
            in: ...Date(),
            displayedComponents: [.date]
        )
        .datePickerStyle(.graphical)
    }
    
    var colorGrid: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.flexible(), spacing: 24), count: 3),
            alignment: .center,
            spacing: 16,
            pinnedViews: [.sectionHeaders],
            content: {
                Section(content: {
                    ForEach(presenter.habitThemeColors, id: \.self) { color in
                        Circle()
                            .fill(color)
                            .overlay(
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.white)
                                    .opacity(presenter.selectedColor == color ? 1: 0)
                            )
                            .onTapGesture {
                                presenter.onColorPressed(color: color)
                            }
                            .accessibilityIdentifier("ColorCircle")
                    }
                }, header: {
                    Text("Select a habit color")
                        .multilineTextAlignment(.center)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                })
            }
        )
    }
}

#Preview {
    let container = DevPreview.shared.container
    let builder = CoreBuilder(interactor: CoreInteractor(container: container))
    
    return RouterView { router in
        builder.createHabitView(router: router)
    }
}
