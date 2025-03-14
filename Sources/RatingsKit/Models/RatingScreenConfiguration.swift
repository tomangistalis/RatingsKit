//
//  RatingScreenConfiguration.swift
//  RatingsKit
//
//  Created by Alpay Calalli on 11.03.25.
//

import SwiftUI

/// Configuration for the rating screen.
public struct RatingScreenConfiguration {
    let screenTitle: LocalizedStringKey
    let giveRatingButtonTitle: LocalizedStringKey
    let maybeLaterButtonTitle: LocalizedStringKey
    let memojis: [Memoji]
    
    /// Initializes a new `RatingScreenConfiguration` with the specified parameters.
    ///
    /// - Parameters:
    ///   - screenTitle: The title of the rating screen.
    ///   - giveRatingButtonTitle: The title of the button that allows the user to give a rating.
    ///   - maybeLaterButonTitle: The title of the button that allows the user to dismiss the rating screen for later.
    public init(
        screenTitle: LocalizedStringKey = "Help Us Grow",
        giveRatingButtonTitle: LocalizedStringKey = "Give Rating",
        maybeLaterButtonTitle: LocalizedStringKey = "Maybe Later",
        memojis: [Image] = .defaultMemojis
    ) {
        self.screenTitle = screenTitle
        self.giveRatingButtonTitle = giveRatingButtonTitle
        self.maybeLaterButtonTitle = maybeLaterButtonTitle
        self.memojis = memojis.map { .init(image: $0) }
    }
}

extension RatingScreenConfiguration {
    /// Default configuration of RatingRequestScreen.
    @MainActor
    static let `default`: Self = .init()
}
