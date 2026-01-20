import SwiftUI

struct AppView<TabbarView: View>: View {
    @State var presenter: AppPresenter
    @ViewBuilder var tabbarView: () -> TabbarView
    
    var body: some View {
        RootView(
            delegate: RootDelegate(
                onApplicationDidAppear: nil,
                onApplicationWillEnterForeground: nil,
                onApplicationDidBecomeActive: nil,
                onApplicationWillResignActive: nil,
                onApplicationDidEnterBackground: nil,
                onApplicationWillTerminate: nil
            ),
            content: {
                AppViewBuilder(
                    tabbarView: {
                        tabbarView()
                    },
                    showTabBar: true
                )
            }
        )
    }
}

#Preview("Appview - TabBar") {
    let container = DevPreview.shared.container
    let builder = RootBuilder(
        interactor: RootInteractor(container: container),
        coreRIB: {
            CoreBuilder(interactor: CoreInteractor(container: container))
        }
    )
    
    return builder.appView()
}
