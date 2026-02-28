import SwiftUI

@Observable
@MainActor
class StatisticsPresenter {
    private let interactor: StatisticsInteractor
    private let router: StatisticsRouter
    
    init(
        interactor: StatisticsInteractor,
        router: StatisticsRouter
    ) {
        self.interactor = interactor
        self.router = router
    }
}
