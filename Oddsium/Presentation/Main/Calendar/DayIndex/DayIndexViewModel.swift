//
//  DayIndexViewModel.swift
//  Oddsium
//
//  Created by Samuel Kebis on 31/01/2023.
//

import Foundation
import Domain

class DayIndexViewModel {
    let dayOffset: Int
    let isSelected: Bool

    private var date: Date {
        Date(dayOffset: dayOffset)
    }

    var title: String {
        date.asString(.dayOfWeek)
    }

    var subtitle: String {
        date.asString(.monthAndDay)
    }

    init(dayOffset: Int, isSelected: Bool) {
        self.dayOffset = dayOffset
        self.isSelected = isSelected
    }
}
