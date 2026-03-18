import SwiftUI

@MainActor
protocol SettingsInteractor {
    func deleteAllHabits() throws
    func deleteAllHabitCompletions() throws
}

extension CoreInteractor: SettingsInteractor { }
