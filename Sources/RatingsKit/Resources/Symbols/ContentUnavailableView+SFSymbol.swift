//
//  ContentUnavailableView+SFSymbol.swift
//
//  Created by James Sedlacek on 3/10/25.
//

import SwiftUI

struct CustomContentUnavailableView<Label: View, Description: View, Actions: View>: View {
    let label: Label
    let description: Description
    let actions: Actions

    package init(
        @ViewBuilder label: () -> Label = { EmptyView() },
        @ViewBuilder description: () -> Description = { EmptyView() },
        @ViewBuilder actions: () -> Actions = { EmptyView() }
    ) {
        self.label = label()
        self.description = description()
        self.actions = actions()
    }

    var body: some View {
        VStack {
            label
            description
            actions
        }
    }
}

extension CustomContentUnavailableView where Label == SwiftUI.Label<Text, Image>, Description == EmptyView {
    init(
        _ titleKey: LocalizedStringKey,
        symbol: Image.SFSymbol,
        @ViewBuilder actions: () -> Actions = { EmptyView() }
    ) {
        self.init(label: {
            Label(titleKey, systemImage: symbol.rawValue)
        },
                  actions: actions)
    }
}
