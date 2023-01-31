//
//  CalendarView.swift
//  Oddsium
//
//  Created by Samuel Kebis on 31/01/2023.
//

import SwiftUI

struct CalendarView: View {
    @State var selectedDay = 1
    private let days: [(Color, Int)] = [(.green, 0), (.blue, 1), (.orange, 2), (.purple, 3)]

    var body: some View {
        VStack {
            DaySelectionView(
                selected: $selectedDay,
                days: days
            ) {
                Circle()
                    .foregroundColor(days[$0].0)
            }
            .frame(height: .selectionViewHeight)

            TabView(selection: $selectedDay) {
                ForEach(days, id: \.1) { (page, index) in
                    Circle()
                        .foregroundColor(page)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .animation(.default, value: selectedDay)
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
