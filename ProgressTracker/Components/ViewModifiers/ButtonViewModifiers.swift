//
//  ButtonViewModifiers.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 06/01/2026.
//

import SwiftUI

enum ButtonStyleOption {
    case plain, press
}

extension View {
    @ViewBuilder
    func anyButton(
        _ option: ButtonStyleOption = .plain,
        action: @escaping () -> Void
    ) -> some View {
        switch option {
        case .plain:
            self.plainButton(action: action)
        case .press:
            self.pressableButton(action: action)
        }
    }
    
    private func plainButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func pressableButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(PressableButtonStyle())
    }
}

private struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.smooth, value: configuration.isPressed)
    }
}
