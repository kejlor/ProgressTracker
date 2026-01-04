import SwiftUI

@Observable
@MainActor
class HabitPresenter {
    private let interactor: HabitInteractor
    private let router: HabitRouter
    
    init(interactor: HabitInteractor, router: HabitRouter) {
        self.interactor = interactor
        self.router = router
    }
}
