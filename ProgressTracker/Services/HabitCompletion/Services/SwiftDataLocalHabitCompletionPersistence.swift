//
//  SwiftDataLocalHabitCompletionPersistence.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 01/03/2026.
//

import SwiftUI
import SwiftData

@MainActor
struct SwiftDataLocalHabitCompletionPersistence: LocalHabitCompletionPersistence {
    private let container: ModelContainer
    private let calendar: Calendar
    
    private var mainContext: ModelContext {
        container.mainContext
    }
    
    init(
        container: ModelContainer,
        calendar: Calendar = Calendar.current
    ) {
        self.container = container
        self.calendar = calendar
    }
    
    func addHabitToCompletions(habit: HabitModel, date: Date) throws {
        let entity = HabitCompletionEntity(
            habitId: habit.id,
            date: date
        )
        mainContext.insert(entity)
        try mainContext.save()
    }
    
    func getAllHabitCompletions() throws -> [HabitCompletionModel] {
        let descriptor = FetchDescriptor<HabitCompletionEntity>()
        let entities = try mainContext.fetch(descriptor)
        return entities.map({ $0.toModel() })
    }
    
    func getHabitCompletions(habit: HabitModel) throws -> [HabitCompletionModel] {
        let descriptor = FetchDescriptor<HabitCompletionEntity>(
            predicate: #Predicate { $0.habitId == habit.id }
        )
        let entities = try mainContext.fetch(descriptor)
        return entities.map({ $0.toModel() })
    }
    
    func deleteHabitCompletion(habit: HabitModel, date: Date) throws {
        let descriptor = FetchDescriptor<HabitCompletionEntity>(
            predicate: #Predicate {
                $0.habitId == habit.id && $0.date == date
            }
        )
        
        if let entityToDelete = try mainContext.fetch(descriptor).first {
            mainContext.delete(entityToDelete)
            try mainContext.save()
        }
    }
    
    func deleteAllHabitCompletions() throws {
        try mainContext.delete(model: HabitCompletionEntity.self)
    }
}
