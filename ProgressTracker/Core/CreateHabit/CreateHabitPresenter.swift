import SwiftUI

@Observable
@MainActor
class CreateHabitPresenter {
    private let interactor: CreateHabitInteractor
    private let router: CreateHabitRouter
    
    private(set) var selectedColor: Color?
    private(set) var name: String?
    let profileColors: [Color] = [.red, .green, .orange, .blue, .mint, .purple, .cyan, .teal, .indigo]
    
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
        guard let selectedColor, let name else { return }
        // TODO: Add habit to SwiftData
    }
}
