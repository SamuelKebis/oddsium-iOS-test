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
            daysSelectionView()
                .frame(height: 100)

            TabView(selection: $selectedDay) {
                ForEach(days, id: \.1) { (page, index) in
                    Circle()
                        .foregroundColor(page)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }

    @ViewBuilder
    private func daysSelectionView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 8) {
                ForEach(days, id: \.1) { (page, _) in
                    Circle()
                        .foregroundColor(page)
                }
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
