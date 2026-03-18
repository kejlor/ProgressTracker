import SwiftUI

struct SettingsView: View {
    @State var presenter: SettingsPresenter
    
    var body: some View {
        VStack {
            Button {
                presenter.onDeleteAllHabitsDataButtonPressed()
            } label: {
                Text("Delete all habits data")
            }
        }
    }
}

#Preview {
    let container = DevPreview.shared.container
    let builder = CoreBuilder(interactor: CoreInteractor(container: container))
    
    return RouterView { router in
        builder.settingsView(router: router)
    }
}
