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
        // Example: "2023-02-06"
        case apiRequest
        // Example: "Mon, Dec 13, 20:00"
        case matchHeader
    }

    func asString(_ format: AsStringFormat) -> String {
        switch format {
        case .dayOfWeek:
            if isToday {
                return "Today"
            } else if wasYesterday {
                return "Yesterday"
            } else if isTomorrow {
                return "Tomorrow"
            }
            return formatted(Date.FormatStyle().weekday(.wide))

        case .monthAndDay:
            return toString("MMM d")

        case .apiRequest:
            return toString("yyyy-MM-dd")

        case .matchHeader:
            return toString("E, MMM dd, hh:mm")
        }
    }

    private func toString(_ stringFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = stringFormat
        return formatter.string(from: self)
    }
}
