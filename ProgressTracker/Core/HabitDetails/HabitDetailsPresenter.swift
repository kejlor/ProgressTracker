import SwiftUI

@Observable
@MainActor
class HabitDetailsPresenter {
    private let interactor: HabitDetailsInteractor
    private let router: HabitDetailsRouter
    private let habit: HabitModel
    
    var habitNameText: String
    var habitDateCrreated: Date?
    var selectedColor: Color?
    
    init(
        interactor: HabitDetailsInteractor,
        router: HabitDetailsRouter,
        habit: HabitModel
    ) {
        self.interactor = interactor
        self.router = router
        self.habit = habit
        
        self.habitNameText = habit.name
        self.habitDateCrreated = habit.dateCreated
        self.selectedColor = habit.habitColorCalculated
    }
    
    func onColorPressed(color: Color) {
        selectedColor = color
    }
    
    func onSavePressed() {
        // TODO: Add logic to update model inside swiftdata
    }
    
    func onDeletePressed() {
        // TODO: Add logic to delete model from SwiftData
    }
}
