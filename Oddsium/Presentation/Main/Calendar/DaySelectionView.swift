//
//  DaySelectionView.swift
//  Oddsium
//
//  Created by Samuel Kebis on 31/01/2023.
//

import SwiftUI

struct DaySelectionView: View {
    @Binding var selected: Int

    let daysRange: Range<Int>

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: .dayIndexSpacing) {
                ForEach(daysRange, id: \.self) { index in
                    Button {
                        selected = index
                    } label: {
                        DayIndexView(dayOffset: index, isSelected: index == selected)
                    }
                    .frame(width: .dayIndexViewWidth)
                }
            }
        }
    }
}

private extension CGFloat {
    static let dayIndexSpacing: CGFloat = 8
    static let dayIndexViewWidth: CGFloat = 100
}

// MARK: - Preview

struct DaySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DaySelectionView(
            selected: .constant(0),
            daysRange: -1..<6
        )
        .frame(height: 100)
    }
}
