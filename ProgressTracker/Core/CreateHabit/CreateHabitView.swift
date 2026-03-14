import SwiftUI

struct CreateHabitView: View {
    @State var presenter: CreateHabitPresenter
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                textFieldSection
                colorGrid
                    .padding(.horizontal, 24)
            }
            .safeAreaInset(
                edge: .bottom,
                alignment: .center,
                spacing: 16,
                content: {
                    ZStack {
                        if let selectedColor = presenter.selectedColor {
                            ctaButton(selectedColor: selectedColor)
                                .transition(AnyTransition.move(edge: .bottom))
                        }
                    }
                    .padding(24)
                    .background(Color(uiColor: .systemBackground))
                }
            )
            .animation(.bouncy, value: presenter.selectedColor)
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Add", systemImage: "checkmark") {
                    presenter.onAddPressed()
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text("Add new habit")
            }
            
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel", systemImage: "xmark") {
                    presenter.onCancelPressed()
                }
            }
        }
//        .toolbarBackgroundVisibility(.hidden, for: .navigationBar)
        //        .navigationTitle("Add new habit")
    }
}

private extension CreateHabitView {
    var textFieldSection: some View {
        TextField("Enter habit name", text: $presenter.habitNameText)
            .keyboardType(.alphabet)
            .autocorrectionDisabled()
            .accessibilityIdentifier("HabitTextField")
    }
    
    var colorGrid: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.flexible(), spacing: 24), count: 3),
            alignment: .center,
            spacing: 16,
            pinnedViews: [.sectionHeaders],
            content: {
                Section(content: {
                    ForEach(presenter.profileColors, id: \.self) { color in
                        Circle()
                        // TODO: Add unique accent color or think about better idea of selecting color
//                            .fill(.accent)
                            .overlay(
                                color
                                    .clipShape(Circle())
                                    .padding(presenter.selectedColor == color ? 10: 0)
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
    
    func ctaButton(selectedColor: Color) -> some View {
        Text("Continue")
            .callToActionButton()
            .anyButton(action: {
                presenter.onAddPressed()
            })
            .accessibilityIdentifier("ContinueButton")
    }
}

#Preview {
    let container = DevPreview.shared.container
    let builder = CoreBuilder(interactor: CoreInteractor(container: container))
    
    return RouterView { router in
        builder.createHabitView(router: router)
    }
}
