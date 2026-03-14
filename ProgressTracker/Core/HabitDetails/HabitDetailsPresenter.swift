import SwiftUI

@Observable
@MainActor
class HabitDetailsPresenter {
    private let interactor: HabitDetailsInteractor
    private let router: HabitDetailsRouter
    private var habit: HabitModel
    private let refetchData: () -> Void
    private let dateFormatter: DateFormatter
    private let calendar: Calendar
    
    private(set) var previousDates: [Date] = []
    private(set) var currentOffset = 0
    private(set) var habitCompletions: [HabitCompletionModel] = []
    
    var currentHabitColor: Color
    var habitNameText: String
    var habitDateCrreated: Date?
    var selectedColor: Color?
    
    init(
        interactor: HabitDetailsInteractor,
        router: HabitDetailsRouter,
        habit: HabitModel,
        refetchData: @escaping () -> Void,
        dateFormatter: DateFormatter = DateFormatter(),
        calendar: Calendar = Calendar.current
    ) {
        self.interactor = interactor
        self.router = router
        self.habit = habit
        self.refetchData = refetchData
        self.dateFormatter = dateFormatter
        dateFormatter.dateStyle = .medium
        self.calendar = calendar
        
        self.currentHabitColor = habit.habitColorCalculated
        self.habitNameText = habit.name
        self.habitDateCrreated = habit.startDate
        self.selectedColor = habit.habitColorCalculated
        
        fetchHabitCompletions()
        loadPreviousDates()
    }
    
    private func fetchHabitCompletions() {
        do {
            habitCompletions = try interactor.getHabitCompletions(habit: habit)
        } catch {
            print("Caught error while fetching habit completions")
        }
    }
    
    func habitCompletionButtonAction(date: Date) {
        let day = calendar.startOfDay(for: date)
        
        if habitCompletions.contains(where: { $0.date == day }) {
            removeFromCompletedHabits(date: date)
        } else {
            addToCompletedHabits(date: date)
        }
        
        fetchHabitCompletions()
        updateDaysCount()
    }
    
    private func addToCompletedHabits(date: Date) {
        do {
            let day = calendar.startOfDay(for: date)
            try interactor.addHabitToCompletions(habit: habit, date: day)
        } catch {
            print("Caught error while adding habit to completions")
        }
    }
    
    private func removeFromCompletedHabits(date: Date) {
        do {
            let day = calendar.startOfDay(for: date)
            try interactor.deleteHabitCompletion(habit: habit, date: day)
        } catch {
            print("Caught error while removing habit from completions")
        }
    }
    
    func hasCompletedHabit(at date: Date) -> Bool {
        let day = calendar.startOfDay(for: date)
        return habitCompletions.contains(where: { $0.date == day })
    }
    
    func onColorPressed(color: Color) {
        selectedColor = color
    }
    
    func onUpdatePressed() {
        updateHabit()
        refetchData()
    }
    
    private func updateHabit() {
        do {
            habit.name = habitNameText
            try interactor.updateHabit(habit: habit)
        } catch {
            print("Caught an error while updating habit")
        }
    }
    
    private func updateDaysCount() {
        do {
            habit.days = habitCompletions.count
            try interactor.updateHabit(habit: habit)
        } catch {
            print("Caught an error while updating days count")
        }
    }
    
    func onDeletePressed() {
        do {
            try interactor.removeHabit(habit: habit)
            refetchData()
            router.dismissScreen()
        } catch {
            print("Caught an error while removing habit")
        }
    }
    
    func formatDate(date: Date) -> String {
        dateFormatter.string(from: date)
    }
    
    private func loadPreviousDates() {
        var currentDate = Date.now
        
        while currentDate >= habit.startDate {
            previousDates.append(currentDate)
            
            guard let previousDate = calendar.date(byAdding: .day, value: -1, to: currentDate) else {
                break
            }
            
            currentDate = previousDate
        }
    }
}

extension Date {
    func dayKey(calendar: Calendar = .current) -> Date {
        calendar.startOfDay(for: self)
    }
}
