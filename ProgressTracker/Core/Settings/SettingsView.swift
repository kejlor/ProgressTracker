import SwiftUI

struct SettingsView: View {
    @State var presenter: SettingsPresenter
    
    var body: some View {
        VStack {
            Button {
                // TODO: Add logic
            } label: {
                Text("Delete all habits")
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
