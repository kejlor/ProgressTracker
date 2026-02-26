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
        try insertHabit(habit: habit)
    }
    
    func getHabits() throws -> [HabitModel] {
        let descriptor = FetchDescriptor<HabitEntity>(sortBy: [SortDescriptor(\.dateAdded, order: .reverse)])
        let entities = try mainContext.fetch(descriptor)
        return entities.map({ $0.toModel() })
    }
    
    func removeHabit(habit: HabitModel) throws {
        let habitEntity = HabitEntity(from: habit)
        let idToDelete = habitEntity.persistentModelID
        try mainContext.delete(model: HabitEntity.self, where: #Predicate { user in
            user.persistentModelID == idToDelete
        })
        try mainContext.save()
    }
    
    func updateHabit(habit: HabitModel) throws {
        try insertHabit(habit: habit)
    }
    
    private func insertHabit(habit: HabitModel) throws {
        let entity = HabitEntity(from: habit)
        mainContext.insert(entity)
        try mainContext.save()
    }
}
