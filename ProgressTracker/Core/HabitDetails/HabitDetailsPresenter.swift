import SwiftUI

@Observable
@MainActor
class HabitDetailsPresenter {
    private let interactor: HabitDetailsInteractor
    private let router: HabitDetailsRouter
    private let habit: HabitModel
    private let dateFormatter: DateFormatter
    private let calendar: Calendar
    
    private(set) var previousDates: [Date] = []
    private(set) var currentOffset = 0
    
    // MARK: New approach
    private(set) var completedDays: Set<Date> = []
    
    var currentHabitColor: Color
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
        
        self.currentHabitColor = habit.habitColorCalculated
        self.habitNameText = habit.name
        self.habitDateCrreated = habit.dateCreated
        self.selectedColor = habit.habitColorCalculated
        
        fetchCompletedDays()
        loadPreviousDates()
    }
    
    // MARK: AI Solution
    private func fetchCompletedDays() {
        do {
            let completedHabits = try interactor.getHabitCompletions(habit: habit).map({ $0.date })
            print("debugs: completedHabits \(completedHabits)")
//            completedDays = Set(completedHabits)
            
            completedDays = Set(
                completedHabits.map { calendar.startOfDay(for: $0) }
            )
            
        } catch {
            print("Caught error while fetching completed days")
        }
    }
    
    func hasCompletedHabit(at date: Date) -> Bool {
//        print("debugs: no ciekawe ile razy bedzie to wywolane")
        let day = calendar.startOfDay(for: date)
        return completedDays.contains(day)
    }
    
    func onCompletePressed(for date: Date) {
        let day = calendar.startOfDay(for: date)
        
        do {
            if completedDays.contains(day) {
                try interactor.deleteHabitCompletion(habit: habit, date: day)
            } else {
                try interactor.addHabitToCompletions(habit: habit, date: day)
            }
            fetchCompletedDays()
        } catch {
            print("Caught error while complete pressed")
        }
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
