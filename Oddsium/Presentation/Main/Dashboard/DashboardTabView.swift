//
//  DashboardTabView.swift
//  
//
//  Created by Samuel Kebis on 27/01/2023.
//

import Navigation
import ShortcutFoundation
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
    @InjectObject private var calendarNavigator: AppNavigator
    @State var selection: DashboardTabView.Tab = .calendar

    var body: some View {
        TabView(selection: $selection) {
            ForEach(Tab.allCases, id: \.self) { tab in
                viewFor(tab)
                    .tabItem {
                        tab.icon
                        Text(tab.title)
                    }
                    .tag(tab)
            }
        }
    }

    @ViewBuilder
    func viewFor(_ tab: Tab) -> some View {
        switch tab {
        case .calendar:
            calendarNavigator.rootView
        default:
            Text(tab.title)
        }
    }
}

// MARK: - Tabs

private extension DashboardTabView.Tab {
    var icon: Image? {
        switch self {
        case .myBets:
            return Image(symbol: .checkmarkSquare)
        case .allMatches:
            return Image(symbol: .globe)
        case .menu:
            return Images.tabHome.swiftUIImage
                .renderingMode(.template)
        case .calendar:
            return Image(symbol: .calendar)
        case .favourites:
            return Image(symbol: .star)
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
}

// MARK: - Preview

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTabView()
    }
}
