import SwiftUI

@Observable
@MainActor
class CreateHabitPresenter {
    private let interactor: CreateHabitInteractor
    private let router: CreateHabitRouter
    
    private(set) var selectedColor: Color?
    
    let profileColors: [Color] = [.red, .green, .orange, .blue, .mint, .purple, .cyan, .teal, .indigo]
    var habitNameText: String = ""
    
    init(
        interactor: CreateHabitInteractor,
        router: CreateHabitRouter
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    func onColorPressed(color: Color) {
        selectedColor = color
    }
    
    func onAddPressed() {
        guard let selectedColor else { return }
        
        let habit = HabitModel(
            id: UUID(),
            habitColorHex: selectedColor.asHex(),
            days: 0,
            name: habitNameText
        )
        
        do {
            try interactor.addHabit(habit: habit)
            router.dismissScreen()
        } catch {
            print("Caught error while adding habit")
        }
    }
}
