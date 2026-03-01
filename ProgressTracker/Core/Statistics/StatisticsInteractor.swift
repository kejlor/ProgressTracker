import SwiftUI

@MainActor
protocol StatisticsInteractor {
    func getAllHabitCompletions() throws -> [HabitCompletionModel]
}

extension CoreInteractor: StatisticsInteractor { }
