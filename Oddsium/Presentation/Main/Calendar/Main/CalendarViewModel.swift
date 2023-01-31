//
//  CalendarViewModel.swift
//  Oddsium
//
//  Created by Samuel Kebis on 31/01/2023.
//

import SwiftUI

class CalendarViewModel: ObservableObject {
    @Published var selectedDay = 1
    let daysRange: Range<Int> = Int.maxPastDayToSee..<Int.maxFutureDayToSee
}

private extension Int {
    static let maxPastDayToSee = -1
    static let maxFutureDayToSee = 10
}
