//
//  MatchesListView.swift
//  Oddsium
//
//  Created by Samuel Kebis on 01/02/2023.
//

import SwiftUI
import Domain

struct MatchesListView: View {
    // swiftlint:disable:next identifier_name
    let vm: MatchesListViewModel

    init?(dayMatches: DayMatches?) {
        guard let dayMatches else {
            return nil
        }
        self.vm = .init(dayMatches: dayMatches)
    }

    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 4) {
                ForEach(vm.dayMatches.matches) { match in
                    MatchRowView(match: match)
                        .onTapGesture {
                            vm.tappedMatch(match)
                        }
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
