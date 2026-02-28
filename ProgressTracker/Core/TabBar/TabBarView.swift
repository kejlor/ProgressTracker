//
//  TabBarView.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 27/02/2026.
//

import SwiftUI

struct TabBarScreen: Identifiable {
    var id: String {
        title
    }
    
    let title: String
    let systemImage: String
    @ViewBuilder var screen: () -> AnyView
}

struct TabBarView: View {
    var tabs: [TabBarScreen]
    
    var body: some View {
        TabView {
            ForEach(tabs) { tab in
                tab.screen()
                    .tabItem { Label(tab.title, systemImage: tab.systemImage) }
            }
        }
    }
}

#Preview("Fake tabs") {
    TabBarView(
        tabs: [
            TabBarScreen(
                title: "Habits",
                systemImage: "brain.head.profile",
                screen: { Color.red.any() }
            ),
            TabBarScreen(
                title: "Settings",
                systemImage: "gear",
                screen: { Color.green.any() }
            ),
            TabBarScreen(
                title: "Mock",
                systemImage: "person.fill",
                screen: { Color.blue.any() }
            )
        ]
    )
}
