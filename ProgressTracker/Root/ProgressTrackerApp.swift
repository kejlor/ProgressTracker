//
//  ProgressTrackerApp.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 03/01/2026.
//

import SwiftUI
import SwiftData

@main
struct ProgressTrackerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            delegate.builder.build()
        }
    }
}
