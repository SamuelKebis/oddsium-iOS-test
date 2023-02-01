//
//  MatchesListView.swift
//  Oddsium
//
//  Created by Samuel Kebis on 01/02/2023.
//

import SwiftUI
import Domain

struct MatchesListView: View {
    let dayMatches: DayMatches

    init?(dayMatches: DayMatches?) {
        guard let dayMatches else {
            return nil
        }
        self.dayMatches = dayMatches
    }

    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 4) {
                ForEach(dayMatches.matches) {
                    MatchRowView(match: $0)
                        .padding(.horizontal, 4)
                }
            }
        }
    }
}

struct DayMatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesListView(dayMatches: nil)
    }
}
