import SwiftUI

@Observable
@MainActor
class HabitsPresenter {
    private let interactor: HabitsInteractor
    private let router: HabitsRouter
    
    // TODO: Change to SwiftData Entity model
    private(set) var habits: [HabitProps] = []
    
    init(
        interactor: HabitsInteractor,
        router: HabitsRouter
    ) {
        self.interactor = interactor
        self.router = router
        
        mockHabits()
    }
    
    func onHabitPressed(habit: HabitProps) {
        // TODO: Add constant initialization for HabitProps, pass it to router
        print("debugs: habit has been pressed")
        router.showHabitDetailsView(props: habit)
    }
    
    private func mockHabits() {
        habits = [
            .init(id: "1", selectedColor: .red, days: 10, name: "Programming"),
            .init(id: "2", selectedColor: .green, days: 20, name: "Swimming"),
            .init(id: "3", selectedColor: .blue, days: 30, name: "Drawing")
        ]
    }
}
