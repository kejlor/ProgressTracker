import SwiftUI

struct HabitDetailsView: View {
    @State var presenter: HabitDetailsPresenter
    let habit: HabitModel
    
    var body: some View {
        VStack(spacing: 0) {
            editHabitNameSection
            deleteHabitButton
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
    
    private var saveHabitButton: some View {
        Button {
            presenter.onSavePressed()
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
}

extension CoreBuilder {

}

extension CoreRouter {

}

#Preview {
    let container = DevPreview.shared.container
    let builder = CoreBuilder(interactor: CoreInteractor(container: container))
    
    return RouterView { router in
        builder
            .habitDetailsView(
                router: router,
                habit: HabitModel.mock
            )
    }
}
