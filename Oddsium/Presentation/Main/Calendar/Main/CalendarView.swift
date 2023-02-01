//
//  CalendarView.swift
//  Oddsium
//
//  Created by Samuel Kebis on 31/01/2023.
//

import ShortcutFoundation
import SwiftUI

struct CalendarView: View {
    // swiftlint:disable:next identifier_name
    @InjectObject private var vm: CalendarViewModel

    var body: some View {
        VStack {
            DaySelectionView(
                selected: $vm.selectedDay,
                daysRange: vm.daysRange
            )
            .frame(height: .selectionViewHeight)

            TabView(selection: $vm.selectedDay) {
                ForEach(vm.daysRange, id: \.self) { index in
                    MatchesListView(dayMatches: vm.currentDayMatches)
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .animation(.default, value: vm.selectedDay)
    }
}

private extension CGFloat {
    static let selectionViewHeight: CGFloat = 100
}

// MARK: - Preview

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
