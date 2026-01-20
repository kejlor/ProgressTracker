import SwiftUI

@Observable
@MainActor
class AppPresenter {
    private let interactor: AppViewInteractor
    
    init(interactor: AppViewInteractor) {
        self.interactor = interactor
    }
}
