import SwiftUI

struct HabitDetailsView: View {
    @State var presenter: HabitDetailsPresenter
    let props: HabitProps
    
    var body: some View {
        Text("Habit Details View")
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
