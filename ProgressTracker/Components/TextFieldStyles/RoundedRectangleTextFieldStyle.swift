//
//  RoundedRectangleTextFieldStyle.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 14/03/2026.
//

import SwiftUI

struct RoundedRectangleTextFieldStyle: TextFieldStyle {
    // swiftlint:disable:next identifier_name
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical)
            .padding(.horizontal, 8)
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

extension TextFieldStyle where Self == RoundedRectangleTextFieldStyle {
    static var roundedRectangleTextFieldStyle: RoundedRectangleTextFieldStyle {
        RoundedRectangleTextFieldStyle()
    }
}
