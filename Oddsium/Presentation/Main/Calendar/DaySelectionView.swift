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
                        DayIndexView(dayShift: index, isSelected: index == selected)
                    }
                }
            }
        }
    }
}

private extension CGFloat {
    static let dayIndexSpacing: CGFloat = 8
}

// MARK: - Preview

struct DaySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DaySelectionView(
            selected: .constant(1),
            daysRange: 0..<6
        )
        .frame(height: 100)
    }
}
