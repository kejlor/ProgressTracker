import SwiftUI

@Observable
@MainActor
class HabitDetailsPresenter {
    private let interactor: HabitDetailsInteractor
    private let router: HabitDetailsRouter
    private let habit: HabitModel
    private let dateFormatter: DateFormatter
    private let calendar: Calendar
    
    // chyba ze zrobie dictionary [Date: Bool]
    // problem: kazdy 1 komponent z listy jest sprawdzany czy zostal zrobiony
    // cel: sprawdzanie raz na starcie i po tym jak user doda do zrobonych dana date
    private(set) var previousDates: [Date] = []
    private(set) var completedDates: Set<Date> = []
    private(set) var currentOffset = 0
    
    var habitNameText: String
    var habitDateCrreated: Date?
    var selectedColor: Color?
    
    init(
        interactor: HabitDetailsInteractor,
        router: HabitDetailsRouter,
        habit: HabitModel,
        dateFormatter: DateFormatter = DateFormatter(),
        calendar: Calendar = Calendar.current
    ) {
        self.interactor = interactor
        self.router = router
        self.habit = habit
        self.dateFormatter = dateFormatter
        dateFormatter.dateStyle = .medium
        self.calendar = calendar
        
        self.habitNameText = habit.name
        self.habitDateCrreated = habit.dateCreated
        self.selectedColor = habit.habitColorCalculated
        
        getCompletedDates()
        loadPreviousDates()
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
    
    func formatDate(date: Date) -> String {
        dateFormatter.string(from: date)
    }
    
    // TODO: Need further optimalization
//    func hasCompletedHabit(at date: Date) -> Bool {
//        print("debugs: i think it will be called too much")
//        guard let completedDates = habit.completedDates else { return false }
//        return completedDates.contains(where: { $0 == date })
//    }
    
    func hasCompletedHabit(at date: Date) -> Bool {
        print("debugs: i think it will be called too much")
        return completedDates.contains(date.dayKey())
    }
    
    func loadPreviousDates() {
        let startDate = calendar.date(
            byAdding: .day,
            value: -currentOffset,
            to: Date()
        ) ?? Date()

        let newDates = generatePreviousDates(
            from: startDate,
            count: 30
        )

        previousDates.append(contentsOf: newDates)
        currentOffset += 30
    }
    
    func isLastDate(date: Date) -> Bool {
        previousDates.last == date
    }
    
    private func getCompletedDates() {
//        guard let habitCompletedDates = habit.completedDates else { return }
//        completedDates.formUnion(habitCompletedDates)
    }
    
    private func generatePreviousDates(from startDate: Date, count: Int) -> [Date] {
        var dates: [Date] = []
        let calendar = Calendar.current

        for dayOffset in 0..<count {
            if let date = calendar.date(byAdding: .day, value: -dayOffset, to: startDate) {
                dates.append(date)
            }
        }
        return dates
    }
}

extension Date {
    func dayKey(calendar: Calendar = .current) -> Date {
        calendar.startOfDay(for: self)
    }
}
