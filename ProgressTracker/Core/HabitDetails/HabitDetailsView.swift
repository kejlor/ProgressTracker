import SwiftUI

struct HabitDetailsView: View {
    @State var presenter: HabitDetailsPresenter
    let habit: HabitModel
    
    var body: some View {
        Text("Habit Details View")
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
    
    
}

extension CoreBuilder {

}

extension CoreRouter {

}

#Preview {
    let container = DevPreview.shared.container
    let builder = CoreBuilder(interactor: CoreInteractor(container: container))
    let props = HabitProps()
    
    return RouterView { router in
        builder.habitDetailsView(router: router, props: props)
    }
}
