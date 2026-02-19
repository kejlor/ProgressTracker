import SwiftUI

@Observable
@MainActor
class HabitPresenter {
    private let interactor: HabitInteractor
    private let router: HabitRouter
    private let dateFormatter: DateFormatter
    
    init(
        interactor: HabitInteractor,
        router: HabitRouter,
        dateFormatter: DateFormatter = DateFormatter()
    ) {
        self.interactor = interactor
        self.router = router
        self.dateFormatter = dateFormatter
        dateFormatter.dateFormat = "EEEEE"
    }
    
    func formatDate(_ date: Date) -> String {
        dateFormatter.string(from: date)
    }
}
