//
//  EnvironmentValues+Ext.swift
//  RatingsKit
//
//  Created by Alpay Calalli on 11.03.25.
//

import SwiftUI

@MainActor
extension EnvironmentValues {
    @Entry var primaryButtonBackgroundColor: Color = .accentColor
    @Entry var secondaryButtonColor: Color = .accentColor
}

public extension View {
    /// Sets a custom background color for the "Give Rating" button.
    /// - Parameter color: The color to be used for the button's background.
    func primaryButtonBackgroundColor(_ color: Color) -> some View {
        environment(\.primaryButtonBackgroundColor, color)
    }
    
    /// Sets a custom color for the "Maybe Later" button.
    /// - Parameter color: The color to be used for the button.
    func secondaryButtonColor(_ color: Color) -> some View {
        environment(\.secondaryButtonColor, color)
    }
}
