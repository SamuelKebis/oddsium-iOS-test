//
//  DashboardTabView.swift
//  
//
//  Created by Samuel Kebis on 27/01/2023.
//

import SwiftUI

extension DashboardTabView {
    enum Tab: CaseIterable {
        case myBets
        case allMatches
        case menu
        case calendar
        case favourites
    }
}

struct DashboardTabView: View {
    @State private var selection: Tab = .calendar

    var body: some View {
        TabView(selection: $selection) {
            ForEach(Tab.allCases, id: \.self) { tab in
                tab.view
                    .tabItem {
                        tab.icon
                        Text(tab.title)
                    }
                    .tag(tab)
            }
        }
    }
}

// MARK: - Tabs

private extension DashboardTabView.Tab {
    var icon: Image? {
        switch self {
        case .myBets:
            return Image(systemName: "checkmark.square")
        case .allMatches:
            return Image(systemName: "globe")
        case .menu:
            return Images.tabHome.swiftUIImage
                .renderingMode(.template)
        case .calendar:
            return Image(systemName: "calendar")
        case .favourites:
            return Image(systemName: "star")
        }
    }

    var title: String {
        switch self {
        case .myBets:
            return Copy.Tab.myBets
        case .allMatches:
            return Copy.Tab.allMatches
        case .menu:
            return Copy.Tab.menu
        case .calendar:
            return Copy.Tab.calendar
        case .favourites:
            return Copy.Tab.favourites
        }
    }

    @ViewBuilder
    var view: some View {
        switch self {
        default:
            Text(title)
        }
    }
}

// MARK: - Preview

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTabView()
    }
}
