//
//  RatingRequestScreen+Previews.swift
//
//  Created by James Sedlacek on 3/10/25.
//

import SwiftUI

#Preview("Mock Reviews") {
    RatingRequestScreen(
        appId: "1658216708",
        appRatingProvider: MockAppRatingProvider.withMockReviews,
        requestedRatingAction: {
            print("Rating Requested")
        },
        maybeLaterAction: {
            print("Maybe later tapped")
        }
    )
    #if os(macOS)
    .frame(width: 400, height: 600)
    #endif
}

#Preview("No Reviews") {
    RatingRequestScreen(
        appId: "1658216708",
        appRatingProvider: MockAppRatingProvider.noReviews,
        requestedRatingAction: {
            print("Rating Requested")
        },
        maybeLaterAction: {
            print("Maybe later tapped")
        }
    )
    #if os(macOS)
    .frame(width: 400, height: 600)
    #endif
}

#Preview("No Ratings or Reviews") {
    RatingRequestScreen(
        appId: "1658216708",
        appRatingProvider: MockAppRatingProvider.noRatingsOrReviews,
        requestedRatingAction: {
            print("Rating Requested")
        },
        maybeLaterAction: {
            print("Maybe later tapped")
        }
    )
    #if os(macOS)
    .frame(width: 400, height: 600)
    #endif
}

#Preview("Error State") {
    RatingRequestScreen(
        appId: "1658216708",
        appRatingProvider: MockAppRatingProvider.throwsError,
        requestedRatingAction: {
            print("Rating Requested")
        },
        maybeLaterAction: {
            print("Maybe later tapped")
        },
        onError: { error in
            print("Error occurred: \(error)")
        }
    )
    #if os(macOS)
    .frame(width: 400, height: 600)
    #endif
}
