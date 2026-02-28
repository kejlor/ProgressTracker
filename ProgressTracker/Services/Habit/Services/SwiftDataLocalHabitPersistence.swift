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
        self.container = try! ModelContainer(for: HabitEntity.self, HabitCompletionEntity.self)
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
        try mainContext.delete(model: HabitEntity.self, where: #Predicate { habit in
            habit.persistentModelID == idToDelete
        })
        try mainContext.save()
    }
    
    func updateHabit(habit: HabitModel) throws {
        try insertHabit(habit: habit)
    }
    
    func addHabitToCompletions(habit: HabitModel, date: Date) throws {
        let entity = HabitCompletionEntity(
            habitId: habit.id,
            date: date
        )
        mainContext.insert(entity)
        do {
            try mainContext.save()
        } catch {
            print("gowno chuj")
        }
        try mainContext.save()
    }
    
    func getHabitCompletions(habit: HabitModel) throws -> [HabitCompletionModel] {
        let descriptor = FetchDescriptor<HabitCompletionEntity>(
            predicate: #Predicate { $0.habitId == habit.id }
        )
        let entities = try mainContext.fetch(descriptor)
        return entities.map({ $0.toModel() })
    }
    
    func deleteHabitCompletion(habit: HabitModel, date: Date) throws {
        let habitCompletionEntity = HabitCompletionEntity(habitId: habit.id, date: date)
        let idToDelete = habitCompletionEntity.persistentModelID
        try mainContext.delete(model: HabitCompletionEntity.self, where: #Predicate { habitCompletion in
            habitCompletion.persistentModelID == idToDelete
        })
        try mainContext.save()
    }
    
    private func insertHabit(habit: HabitModel) throws {
        let entity = HabitEntity(from: habit)
        mainContext.insert(entity)
        try mainContext.save()
    }
}
