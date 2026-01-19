//
//  ButtonViewModifiers.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 06/01/2026.
//

import SwiftUI

enum ButtonStyleOption {
    case plain
}

extension View {
    @ViewBuilder
    func anyButton(
        _ option: ButtonStyleOption = .plain,
        action: @escaping () -> Void
    ) -> some View {
        self.plainButton(action: action)
    }
    
    private func plainButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(PlainButtonStyle())
    }
}
