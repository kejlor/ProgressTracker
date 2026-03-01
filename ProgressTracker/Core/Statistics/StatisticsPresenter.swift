import SwiftUI

@Observable
@MainActor
class StatisticsPresenter {
    private let interactor: StatisticsInteractor
    private let router: StatisticsRouter
    
    private(set) var completedHabits: [HabitCompletionModel] = []
    
    init(
        interactor: StatisticsInteractor,
        router: StatisticsRouter
    ) {
        self.interactor = interactor
        self.router = router
        
        getCompletedHabits()
    }
    
    func getCompletedHabits() {
        do {
            completedHabits = try interactor.getAllHabitCompletions()
        } catch {
            print("Unable to load completed habits")
        }
    }
}
