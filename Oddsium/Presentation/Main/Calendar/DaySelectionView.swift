//
//  DaySelectionView.swift
//  Oddsium
//
//  Created by Samuel Kebis on 31/01/2023.
//

import SwiftUI

struct DaySelectionView<T: View>: View {
    @Binding var selected: Int

    var days: [(Color, Int)]

    @ViewBuilder
    var dayIndexView: (Int) -> T

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: .dayIndexSpacing) {
                ForEach(days, id: \.1) { (_, index) in
                    Button {
                        selected = index
                    } label: {
                        VStack {
                            dayIndexView(index)

                            HStack {
                                if selected == index {
                                    Rectangle()
                                }
                            }
                            .frame(height: .dayIndexSelectorHeight)
                        }
                    }
                }
            }
        }
    }
}

private extension CGFloat {
    static let dayIndexSpacing: CGFloat = 8
    static let dayIndexSelectorHeight: CGFloat = 8
}

// MARK: - Preview

struct DaySelectionView_Previews: PreviewProvider {
    static let days: [(Color, Int)] = [(.green, 0), (.blue, 1), (.orange, 2), (.purple, 3)]
    static var previews: some View {
        DaySelectionView(
            selected: .constant(1),
            days: days
        ) {
            Circle()
                .foregroundColor(days[$0].0)
        }
        .frame(height: 100)
    }
}
