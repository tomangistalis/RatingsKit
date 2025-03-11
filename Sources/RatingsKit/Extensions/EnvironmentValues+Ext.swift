//
//  EnvironmentValues+Ext.swift
//  RatingsKit
//
//  Created by Alpay Calalli on 11.03.25.
//

import SwiftUI

@MainActor
extension EnvironmentValues {
    @Entry var giveRatingButtonTitle: LocalizedStringKey = "Give a Rating"
    @Entry var maybeLaterButtonTitle: LocalizedStringKey = "Maybe Later"
    @Entry var giveRatingButtonBackgroundColor: Color = .blue
    @Entry var maybeLaterButtonColor: Color = .blue
    @Entry var screenTitle: LocalizedStringKey = "Help Us Grow"
}

public extension View {
    /// Sets a custom title for the "Give Rating" button.
    /// - Parameter title: The localized string key for the button title.
    func giveRatingButtonTitle(_ title: LocalizedStringKey) -> some View {
        environment(\.giveRatingButtonTitle, title)
    }

    /// Sets a custom title for the "Maybe Later" button.
    /// - Parameter title: The localized string key for the button title.
    func maybeLaterButtonTitle(_ title: LocalizedStringKey) -> some View {
        environment(\.maybeLaterButtonTitle, title)
    }
    
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
    
    /// Sets a custom title for the rating request screen.
    /// - Parameter title: The localized string key for the screen title.
    func screenTitle(_ title: LocalizedStringKey) -> some View {
        environment(\.screenTitle, title)
    }
}
