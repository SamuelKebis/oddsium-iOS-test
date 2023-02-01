//
//  Destination.swift
//  VayCayDay
//
//  Created by Samuel Kebis on 2023-01-11.
//  Copyright © 2022 Shortcut Scandinavia Apps AB. All rights reserved.
//

import SwiftUI

/// Enumeration of possible specific destinations in this app.
public enum Destination: NavigationStackable {
    case calendar
    case match
}

/// The navigator specific to this project
public typealias AppNavigator = Navigator<Destination>
