import SwiftUI

@Observable
@MainActor
class HabitPresenter {
    private let interactor: HabitInteractor
    private let router: HabitRouter
    private let calendar: Calendar
    private let dateFormatter: DateFormatter
    
    let weekDays = Date.currentWeekDates
    
    private(set) var habit: HabitModel
    private(set) var habitCompletions: [HabitCompletionModel] = []
    
    
    init(
        interactor: HabitInteractor,
        router: HabitRouter,
        calendar: Calendar = Calendar.current,
        dateFormatter: DateFormatter = DateFormatter(),
        habit: HabitModel
    ) {
        self.interactor = interactor
        self.router = router
        self.calendar = calendar
        self.dateFormatter = dateFormatter
        dateFormatter.dateFormat = "EEEEE"
        self.habit = habit
        
        fetchHabitCompletions()
    }
    
    var hasCompletedToday: Bool {
        let today = calendar.startOfDay(for: .now)
        return habitCompletions.contains(where: { $0.date == today })
    }
    
    func formatDate(_ date: Date) -> String {
        dateFormatter.string(from: date)
    }
    
    func hasCompleted(for date: Date) -> Bool {
        return habitCompletions.contains(where: { $0.date == calendar.startOfDay(for: date) })
    }
    
    func markTodayAsCompleted() {
        let today = calendar.startOfDay(for: .now)
        do {
            try interactor.addHabitToCompletions(habit: habit, date: today)
        } catch {
            print("Caught an error while trying to mark today as completed")
        }
        fetchHabitCompletions()
        updateHabitCount()
    }
    
    private func updateHabitCount() {
        habit.days = habitCompletions.count
        do {
            try interactor.updateHabit(habit: habit)
        } catch {
            print("Caught an error while updating habit")
        }
    }
    
    private func fetchHabitCompletions() {
        do {
            habitCompletions = try interactor.getHabitCompletions(habit: habit)
        } catch {
            print("Caught error while fetching habit completions")
        }
    }
}
