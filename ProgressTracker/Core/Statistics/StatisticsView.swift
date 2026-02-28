import SwiftUI

struct StatisticsView: View {
    @State var presenter: StatisticsPresenter
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    let container = DevPreview.shared.container
    let builder = CoreBuilder(interactor: CoreInteractor(container: container))
    
    return RouterView { router in
        builder.statisticsView(router: router)
    }
}
