//
//  DayMatchesView.swift
//  Oddsium
//
//  Created by Samuel Kebis on 01/02/2023.
//

import SwiftUI
import Domain

struct DayMatchesView: View {
    let dayMatches: DayMatches

    init?(dayMatches: DayMatches?) {
        guard let dayMatches else {
            return nil
        }
        self.dayMatches = dayMatches
    }

    var body: some View {
        Text("First match: " + (dayMatches.matches.first?.name ?? "-"))
    }
}

struct DayMatchesView_Previews: PreviewProvider {
    static var previews: some View {
        DayMatchesView(dayMatches: nil)
    }
}
