//
//  CustomModalView.swift
//  ProgressTracker
//
//  Created by Bartosz Wojtkowiak on 18/03/2026.
//

import SwiftUI

struct CustomModalView: View {
    var title: String = "Title"
    var subtitle: String? = "This is a subtitle."
    var primaryButtonTitle: String = "Yes"
    var primaryButtonAction: () -> Void = { }
    var secondaryButtonTitle: String = "No"
    var secondaryButtonAction: () -> Void = { }
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 12) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                if let subtitle {
                    Text(subtitle)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(12)
            
            VStack(spacing: 8) {
                Text(primaryButtonTitle)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .foregroundStyle(.white)
                    .background(.red)
                    .cornerRadius(16)
                    .anyButton(.press) {
                        primaryButtonAction()
                    }
                
                Text(secondaryButtonTitle)
                    .font(.headline)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .anyButton(.plain) {
                        secondaryButtonAction()
                    }
            }
        }
        .multilineTextAlignment(.center)
        .padding(16)
        .background(Color(uiColor: .systemBackground))
        .cornerRadius(16)
        .padding(40)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        CustomModalView(
            title: "Do you want to delete all data?",
            subtitle: "This action cannot be undone.",
            primaryButtonTitle: "Confirm",
            primaryButtonAction: { },
            secondaryButtonTitle: "Cancel",
            secondaryButtonAction: { }
        )
    }
}
