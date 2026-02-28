import SwiftUI

@Observable
@MainActor
class SettingsPresenter {
    private let interactor: SettingsInteractor
    private let router: SettingsRouter
    
    init(
        interactor: SettingsInteractor,
        router: SettingsRouter
    ) {
        self.interactor = interactor
        self.router = router
    }
}
