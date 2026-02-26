//
//  AppViewBuilder.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 19/01/2026.
//

import SwiftUI

struct AppViewBuilder<TabBarView: View>: View {
    var tabbarView: () -> TabBarView
    var showTabBar: Bool = true
    
    var body: some View {
        ZStack {
            tabbarView()
                .transition(.move(edge: .trailing))
        }
        .animation(.smooth, value: showTabBar)
    }
}

private struct Preview: View {
    @State private var showTabBar: Bool = true
    
    var body: some View {
        AppViewBuilder(
            tabbarView: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("TabBar")
                }
            },
            showTabBar: showTabBar
        )
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview {
    Preview()
}
