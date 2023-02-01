//
//  CalendarViewModel.swift
//  Oddsium
//
//  Created by Samuel Kebis on 31/01/2023.
//

import DataLoader
import Domain
import ShortcutFoundation
import SwiftUI

class CalendarViewModel: ObservableObject {
    @InjectObject var dataProvider: DataProvider

    @Published var allDaysMatches: [Int: DayData] = [:]
    @Published var selectedDay = 0 {
        didSet {
            dataProvider.getDataFor(selectedDay)
        }
    }

    let daysRange: Range<Int> = Int.maxPastDayToSee..<Int.maxFutureDayToSee

    var currentDayMatches: DayMatches? {
        allDaysMatches[selectedDay]?.data
    }

    init() {
        dataProvider.$dayData
            .receive(on: RunLoop.main)
            .assign(to: &$allDaysMatches)

        dataProvider.getDataFor(selectedDay)
    }
}

private extension Int {
    static let maxPastDayToSee = -1
    static let maxFutureDayToSee = 10
}
