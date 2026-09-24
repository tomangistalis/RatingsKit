//
//  RatingRequestScreen+View.swift
//
//  Created by James Sedlacek on 3/8/25.
//

import SwiftUI

extension RatingRequestScreen: View {
    public var body: some View {
        VStack(spacing: 16) {
            headerSection
            reviewList
        }
        .padding(.top)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.background.secondary)
        .background {
            GeometryReader { proxy in
                Color.clear.preference(key: RatingPageWidthKey.self, value: proxy.size.width)
            }
        }
        .onPreferenceChange(RatingPageWidthKey.self) { pageWidth = $0 }
        .safeAreaInset(
            edge: .bottom,
            content: callToActionSection
        )
        .overlay(content: errorStateView)
        .task(fetchData)
    }
}

// MARK: Header Section
extension RatingRequestScreen {
    private var headerSection: some View {
        VStack(alignment: .center, spacing: 12) {
            titleView
            averageRatingView
            totalRatingsView
        }
    }

    private var titleView: some View {
        Text(configuration.screenTitle)
            .font(.largeTitle.bold())
    }

    private var averageRatingView: some View {
        RatingView(rating: averageRating)
            .redacted(when: state.isLoading)
    }

    @ViewBuilder
    private var totalRatingsView: some View {
        if isShowingNoRatings {
            Text(.noRatingsYet)
        } else {
            HStack {
                MemojisStack(memojis: configuration.memojis)
                Text(.ratings(totalRatings))
                    .font(.body.weight(.medium))
                    .redacted(when: state.isLoading)
            }
        }
    }
}

// MARK: Review List
extension RatingRequestScreen {
    private var reviewList: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                if state.isLoading {
                    loadingReviewCards
                } else {
                    reviewCards
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
        .overlay(noReviewsView)
    }

    private var loadingReviewCards: some View {
        ForEach(0..<5, id: \.self) { _ in
            ReviewCard(review: .mock(), memoji: Image(.person1))
                .redacted(reason: .placeholder)
        }
    }

    private var reviewCards: some View {
        ForEach(reviews.indices, id: \.self) { index in
            if let review = reviews[safe: index],
               let memoji = configuration.memojis[safe: index] {
                ReviewCard(review: review, memoji: memoji)
            }
        }
    }

    @ViewBuilder
    private var noReviewsView: some View {
        if isShowingNoReviews {
            NoReviewsView()
        }
    }
}

// MARK: Call to Action Section
extension RatingRequestScreen {
    @ViewBuilder
    private func callToActionSection() -> some View {
        if !state.isLoading {
            VStack(spacing: 20) {
                primaryButton
                secondaryButton
            }
            .padding(.vertical, 12)
            .background(.background.secondary)
            .transition(.move(edge: .bottom))
        }
    }

    /// Same chrome as Recap's dismiss button (system title3 bold, 16pt corners,
    /// 40pt side inset) so a rating page embedded in What's New matches Continue.
    private var primaryButton: some View {
        Button(action: ratingRequestAction) {
            HStack {
                Spacer(minLength: 0)

                Text(configuration.primaryButtonTitle)
                    .font(.system(.title3, weight: .bold))
                    .padding(8)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 16)
                    .foregroundStyle(.white)

                Spacer(minLength: 0)
            }
            .contentShape(.rect(cornerRadius: 16))
        }
        .buttonStyle(.plain)
        .contentShape(.rect(cornerRadius: 16))
        .frame(maxWidth: .infinity)
        .frame(width: pageWidth > 80 ? pageWidth - 80 : nil)
        .background(.tint)
        .clipShape(.rect(cornerRadius: 16))
    }

    @ViewBuilder
    private var secondaryButton: some View {
        if let secondaryButtonAction {
            Button(
                action: secondaryButtonAction,
                label: {
                    Text(configuration.secondaryButtonTitle)
                        .font(.body.weight(.medium))
                }
            )
            .buttonStyle(.borderless)
        }
    }
}

private struct RatingPageWidthKey: PreferenceKey {
    static let defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

// MARK: Error State
extension RatingRequestScreen {
    @ViewBuilder
    private func errorStateView() -> some View {
        if let errorMessage = state.errorMessage {
            TryAgainView(
                errorMessage: errorMessage,
                tryAgainAction: tryAgainAction
            )
        }
    }
}
