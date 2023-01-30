//
//  SFSymbol.swift
//  Oddsium
//
//  Created by Samuel Kebis on 30/01/2023.
//

import SwiftUI

extension Image {
    enum SFSymbol: String {
        case checkmarkSquare = "checkmark.square"
        case globe = "globe"
        case calendar = "calendar"
        case star = "star"
    }

    init(symbol: SFSymbol) {
        self.init(systemName: symbol.rawValue)
    }
}
