//
//  OddsiumApp.swift
//  Oddsium
//
//  Created by Samuel Kebis on 27/01/2023.
//

import ShortcutFoundation
import SwiftUI

@main
struct OddsiumApp: App {
    let context = Context(AppConfig())

    var body: some Scene {
        WindowGroup {
            DashboardTabView()
        }
    }
}
