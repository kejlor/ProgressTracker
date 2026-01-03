import SwiftUI

@MainActor
struct CoreBuilder: Builder {
    let interactor: CoreInteractor
    
    func build() -> AnyView {
        Text("Welcome in Progress Tracker")
            .any()
    }
}
