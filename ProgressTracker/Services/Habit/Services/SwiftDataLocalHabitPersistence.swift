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
    
    init(container: ModelContainer) {
        self.container = container
    }
    
    func addHabit(habit: HabitModel) throws {
        try insertHabit(habit: habit)
    }
    
    func getHabits() throws -> [HabitModel] {
        let descriptor = FetchDescriptor<HabitEntity>(sortBy: [SortDescriptor(\.startDate, order: .reverse)])
        let entities = try mainContext.fetch(descriptor)
        return entities.map({ $0.toModel() })
    }
    
    func removeHabit(habit: HabitModel) throws {
        let descriptor = FetchDescriptor<HabitEntity>(
            predicate: #Predicate {
                $0.id == habit.id
            }
        )
        
        if let entityToDelete = try mainContext.fetch(descriptor).first {
            mainContext.delete(entityToDelete)
            try mainContext.save()
        }
    }
    
    func updateHabit(habit: HabitModel) throws {
        guard let existing = try fetch(by: habit.id) else { return }
        existing.habitColorHex = habit.habitColorHex
        existing.days = habit.days
        existing.name = habit.name
        
        try mainContext.save()
    }
    
    private func insertHabit(habit: HabitModel) throws {
        let entity = HabitEntity(from: habit)
        mainContext.insert(entity)
        try mainContext.save()
    }
    
    private func fetch(by id: UUID) throws -> HabitEntity? {
        let descriptor = FetchDescriptor<HabitEntity>(predicate: #Predicate { $0.id == id})
        return try mainContext.fetch(descriptor).first
    }
}
