import SwiftUI

@Observable
@MainActor
class HabitsPresenter {
    private let interactor: HabitsInteractor
    private let router: HabitsRouter
    
    private(set) var habits: [HabitModel] = []
    
    init(
        interactor: HabitsInteractor,
        router: HabitsRouter,
    ) {
        self.interactor = interactor
        self.router = router
        
        getHabits()
    }
    
    func onHabitPressed(habit: HabitModel) {
        router.showHabitDetailsView(habit: habit)
    }
    
    func onAddHabitPressed() {
        router.showAddHabitView()
    }
    
    func addHabit(habit: HabitModel) {
        do {
            try interactor.addHabit(habit: habit)
        } catch {
            print("Unable to add habit")
        }
    }
    
    func getHabits() {
        do {
            habits = try interactor.getHabits()
        } catch {
            print("Unable to load habits")
        }
    }
}
