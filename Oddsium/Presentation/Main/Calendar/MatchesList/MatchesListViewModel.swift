//
//  MatchesListViewModel.swift
//  Oddsium
//
//  Created by Samuel Kebis on 01/02/2023.
//

import Domain
import Foundation
import Navigation
import ShortcutFoundation

class MatchesListViewModel {
    @InjectObject private var calendarNavigator: AppNavigator

    let dayMatches: DayMatches

    init(dayMatches: DayMatches) {
        self.dayMatches = dayMatches
    }

    func tappedMatch(_ match: Match) {
        calendarNavigator.push(.match)
    }
}
