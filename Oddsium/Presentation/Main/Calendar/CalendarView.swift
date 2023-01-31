//
//  CalendarView.swift
//  Oddsium
//
//  Created by Samuel Kebis on 31/01/2023.
//

import SwiftUI

struct CalendarView: View {
    @State var selectedPage = 1
    private let pages: [(Color, Int)] = [(.green, 0), (.blue, 1), (.orange, 2), (.purple, 3)]

    var body: some View {
        VStack {
            Rectangle()
                .stroke()
                .padding()

            TabView(selection: $selectedPage) {
                ForEach(pages, id: \.1) { (page, index) in
                    Circle()
                        .foregroundColor(page)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
