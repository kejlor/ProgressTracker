import SwiftUI

@MainActor
struct RootBuilder: Builder {
    let interactor: RootInteractor
    let coreRIB: () -> any Builder
    
    func build() -> AnyView {
        appView().any()
    }
    
    func appView() -> some View {
        AppView(
            presenter: AppPresenter(
                interactor: interactor
            ),
            tabBarView: {
                coreRIB().build()
            }
        )
    }
}
