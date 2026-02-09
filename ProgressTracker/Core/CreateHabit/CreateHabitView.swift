import SwiftUI

struct CreateHabitView: View {
    @State var presenter: CreateHabitPresenter
    
    var body: some View {
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
        .toolbar(.hidden, for: .navigationBar)
    }
    
//    private var nameTextfield: some View {
//        TextField(
//            "",
//            text: $presenter.name,
//            prompt:
//                Text(textPlaceholder ?? "")
//                    .foregroundColor(Style.BrandColor.elementLightMedium)
//                    .font(.system(size: 16, weight: .regular))
//        )
//        .textFieldStyle(.plain)
//    }
    
    private var textFieldSection: some View {
        TextField("Enter habit name", text: $presenter.habitNameText)
            .keyboardType(.alphabet)
            .autocorrectionDisabled()
            .accessibilityIdentifier("HabitTextField")
    }
    
    private var colorGrid: some View {
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
    
    private func ctaButton(selectedColor: Color) -> some View {
        Text("Continue")
            .callToActionButton()
            .anyButton(action: {
                presenter.onAddPressed()
            })
            .accessibilityIdentifier("ContinueButton")
    }
}

extension CoreBuilder {
    func createHabitView(router: Router) -> some View {
        CreateHabitView(
            presenter: CreateHabitPresenter(
                interactor: interactor,
                router: CoreRouter(router: router, builder: self)
            )
        )
    }
}

extension CoreRouter {
    func showCreateHabitView() {
        router.showScreen(.push) { router in
            builder.createHabitView(router: router)
        }
    }
}

#Preview {
    let container = DevPreview.shared.container
    let builder = CoreBuilder(interactor: CoreInteractor(container: container))
    
    return RouterView { router in
        builder.createHabitView(router: router)
    }
}
