//
//  RatingScreenConfiguration.swift
//  RatingsKit
//
//  Created by Alpay Calalli on 11.03.25.
//

import Foundation

/// Configuration for the rating screen.
public struct RatingScreenConfiguration {
    let screenTitle: String
    let giveRatingButtonTitle: String
    let maybeLaterButtonTitle: String
    
    /// Initializes a new `RatingScreenConfiguration` with the specified parameters.
    ///
    /// - Parameters:
    ///   - screenTitle: The title of the rating screen.
    ///   - giveRatingButtonTitle: The title of the button that allows the user to give a rating.
    ///   - maybeLaterButonTitle: The title of the button that allows the user to dismiss the rating screen for later.
    public init(
        screenTitle: String = "Help Us Grow",
        giveRatingButtonTitle: String = "Give Rating",
        maybeLaterButtonTitle: String = "Maybe Later"
    ) {
        self.screenTitle = screenTitle
        self.giveRatingButtonTitle = giveRatingButtonTitle
        self.maybeLaterButtonTitle = maybeLaterButtonTitle
    }
}
