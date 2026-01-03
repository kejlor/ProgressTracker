//
//  AppDelegate.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 03/01/2026.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    var dependencies: Dependencies!
    var builder: CoreBuilder!
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        let dependencies = Dependencies()
        builder = CoreBuilder(
            interactor: CoreInteractor(
                container: dependencies.container
            )
        )
        return true
    }
}
