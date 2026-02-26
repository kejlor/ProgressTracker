//
//  View+Extensions.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 03/01/2026.
//

import SwiftUI

extension View {
    func callToActionButton() -> some View {
        self
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
//            .background(.accent)
            .background(.blue)
            .cornerRadius(16)
    }
    
    func any() -> AnyView {
        AnyView(self)
    }
}
