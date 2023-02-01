//
//  AppDestinationViewer.swift
//  VayCayDay
//
//  Created by Samuel Kebis on 2023-01-12.
//  Copyright © 2022 Shortcut Scandinavia Apps AB. All rights reserved.
//

import Navigation
import ShortcutFoundation
import SwiftUI

class AppDestinationViewer: DestinationViewer<Destination> {
    @Inject var calendarNavigator: AppNavigator

    @ViewBuilder
    override func view(for destination: Destination) -> any View {
        switch destination {
        case .calendar:
            calendarNavigator.rootView

        case .match:
            Text("Match Detail")
        }
    }
}
