//
//  EnvironmentValues+Ext.swift
//  RatingsKit
//
//  Created by Alpay Calalli on 11.03.25.
//

import SwiftUI

@MainActor
extension EnvironmentValues {
    @Entry var giveRatingButtonBackgroundColor: Color = .blue
    @Entry var maybeLaterButtonColor: Color = .blue
}

public extension View {
    /// Sets a custom background color for the "Give Rating" button.
    /// - Parameter color: The color to be used for the button's background.
    func giveRatingButtonBackgroundColor(_ color: Color) -> some View {
        environment(\.giveRatingButtonBackgroundColor, color)
    }
    
    /// Sets a custom color for the "Maybe Later" button.
    /// - Parameter color: The color to be used for the button.
    func maybeLaterButtonColor(_ color: Color) -> some View {
        environment(\.maybeLaterButtonColor, color)
    }
}
