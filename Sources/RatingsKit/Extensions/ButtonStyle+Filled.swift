//
//  ButtonStyle+Filled.swift
//
//  Created by James Sedlacek on 11/12/24.
//

import SwiftUI

struct FilledButtonStyle: ButtonStyle {
    private let backgroundColor: Color
    init(backgroundColor: Color = .accentColor) {
        self.backgroundColor = backgroundColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(
                backgroundColor,
                in: .rect(cornerRadius: 10)
            )
            .foregroundStyle(.white)
            .font(.body.weight(.medium))
            .opacity(configuration.isPressed ? 0.8 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .sensoryFeedback(.selection, trigger: configuration.isPressed)
    }
}

extension ButtonStyle where Self == FilledButtonStyle {
    @MainActor @preconcurrency
    static var filled: FilledButtonStyle { .init() }
    
    @MainActor @preconcurrency
    static func filled(backgroundColor: Color) -> FilledButtonStyle {
        .init(backgroundColor: backgroundColor)
    }
    
}

#Preview {
    Button("Hello, World!") {}
        .buttonStyle(.filled)
        .padding()
}
