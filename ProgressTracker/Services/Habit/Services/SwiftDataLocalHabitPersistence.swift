//
//  SwiftDataLocalHabitPersistence.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 15/01/2026.
//

import SwiftUI
import SwiftData

@MainActor
struct SwiftDataLocalHabitPersistence: LocalHabitPersistence {
    private let container: ModelContainer
    
    private var mainContext: ModelContext {
        container.mainContext
    }
    
    init() {
        // swiftlint:disable:next force_try
        self.container = try! ModelContainer(for: HabitEntity.self)
    }
    
    func addHabit(habit: HabitModel) throws {
        let entity = HabitEntity(from: habit)
        mainContext.insert(entity)
        try mainContext.save()
    }
    
    func getHabits() throws -> [HabitModel] {
        let descriptor = FetchDescriptor<HabitEntity>(sortBy: [SortDescriptor(\.dateAdded, order: .reverse)])
        let entities = try mainContext.fetch(descriptor)
        return entities.map({ $0.toModel() })
    }
    
    func removeHabit(habit: HabitModel) throws {
        mainContext.delete(HabitEntity(from: habit))
    }
}
