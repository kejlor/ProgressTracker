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
//        let localHabitService = SwiftDataLocalHabitPersistence()
        let localHabitService = MockLocalHabitPersistence()
        
        let container = DependencyContainer()
        container.register(LocalHabitPersistence.self, service: localHabitService)
        
        self.container = container
    }
}

@MainActor
class DevPreview {
    static let shared = DevPreview()
    
    var container: DependencyContainer {
        let container = DependencyContainer()
        
        return container
    }
}
