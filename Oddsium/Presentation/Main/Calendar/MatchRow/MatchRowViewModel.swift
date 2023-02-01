//
//  MatchRowViewModel.swift
//  Oddsium
//
//  Created by Samuel Kebis on 01/02/2023.
//

import Domain
import Foundation

class MatchRowViewModel {
    private let match: Match

    init(match: Match) {
        self.match = match
    }

    var title: String {
        match.name
    }

    var date: String {
        let dateFormatter = ISO8601DateFormatter()
        let date = dateFormatter.date(from: match.date)
        return date?.asString(.matchHeader) ?? ""
    }

    var description: String {
        match.status.rawValue
    }
}
