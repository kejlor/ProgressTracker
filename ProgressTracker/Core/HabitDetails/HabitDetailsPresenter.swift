import SwiftUI

@Observable
@MainActor
class HabitDetailsPresenter {
    private let interactor: HabitDetailsInteractor
    private let router: HabitDetailsRouter
    
    init(
        interactor: HabitDetailsInteractor,
        router: HabitDetailsRouter
    ) {
        self.interactor = interactor
        self.router = router
    }
}
