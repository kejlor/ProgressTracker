import SwiftUI

struct AppView<TabBarView: View>: View {
    @State var presenter: AppPresenter
    @ViewBuilder var tabBarView: () -> TabBarView
    
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
                    tabBarView: {
                        tabBarView()
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
