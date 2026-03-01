//
//  Dependencies.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 03/01/2026.
//

import SwiftUI
import SwiftData

@MainActor
@Observable
class Dependencies {
    let container: DependencyContainer
    
    init() {
        let habitManager: HabitManager
        let habitCompletionManager: HabitCompletionManager
        
        // swiftlint:disable:next force_try
        let modelContainer = try! ModelContainer(for: HabitEntity.self, HabitCompletionEntity.self)
        
        habitManager = HabitManager(local: SwiftDataLocalHabitPersistence(container: modelContainer))
        habitCompletionManager = HabitCompletionManager(local: SwiftDataLocalHabitCompletionPersistence(container: modelContainer))
        
        let container = DependencyContainer()
        container.register(HabitManager.self, service: habitManager)
        container.register(HabitCompletionManager.self, service: habitCompletionManager)
        
        self.container = container
    }
}

@MainActor
class DevPreview {
    static let shared = DevPreview()
    
    var container: DependencyContainer {
        let container = DependencyContainer()
        container.register(LocalHabitPersistence.self, service: localHabitService)
        
        return container
    }
    
    let localHabitService: MockLocalHabitPersistence
    
    init() {
        self.localHabitService = MockLocalHabitPersistence()
    }
}
