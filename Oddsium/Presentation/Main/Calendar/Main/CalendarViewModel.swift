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

    @Published var matches: [Int: DayData] = [:]
    @Published var selectedDay = 0 {
        didSet {
            dataProvider.getDataFor(selectedDay)
        }
    }

    let daysRange: Range<Int> = Int.maxPastDayToSee..<Int.maxFutureDayToSee

    var matchString: String {
        matches[selectedDay]?.data.matches.first?.name ?? "-"
    }

    init() {
        dataProvider.$dayData
            .receive(on: RunLoop.main)
            .assign(to: &$matches)
    }
}

private extension Int {
    static let maxPastDayToSee = -1
    static let maxFutureDayToSee = 10
}
