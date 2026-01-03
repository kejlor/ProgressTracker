//
//  Dependencies.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 03/01/2026.
//

import SwiftUI

@MainActor
struct Dependencies {
    let container: DependencyContainer
    
    init() {
        let container = DependencyContainer()
        
        self.container = container
    }
}
