//
//  Builder.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 03/01/2026.
//

import SwiftUI

@MainActor
protocol Builder {
    func build() -> AnyView
}
