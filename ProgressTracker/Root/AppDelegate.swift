//
//  AppDelegate.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 03/01/2026.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    var dependencies: Dependencies!
    var builder: RootBuilder!
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        dependencies = Dependencies()
        builder = RootBuilder(
            interactor: RootInteractor(container: dependencies.container),
            coreRIB: {
                CoreBuilder(interactor: CoreInteractor(container: self.dependencies.container))
            }
        )
        return true
    }
}
