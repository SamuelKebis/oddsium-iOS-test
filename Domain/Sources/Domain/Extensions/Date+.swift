//
//  Date+.swift
//  Oddsium
//
//  Created by Samuel Kebis on 31/01/2023.
//

import Foundation
import ShortcutFoundation

public extension Date {
    init(dayOffset: Int) {
        let offsetInSeconds = Double(dayOffset * 24 * 60 * 60)
        self.init(timeIntervalSinceNow: offsetInSeconds)
    }

    enum AsStringFormat {
        /// Example: "Today", "Monday" ...
        case dayOfWeek
        /// Example: "Nov 12"
        case monthAndDay
    }

    func asString(_ format: AsStringFormat) -> String {
        switch format {
        case .dayOfWeek:
            return isToday ? "Today" : formatted(Date.FormatStyle().weekday(.wide))

        case .monthAndDay:
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d"
            return formatter.string(from: self)
        }
    }
}