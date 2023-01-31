//
//  DayIndexView.swift
//  Oddsium
//
//  Created by Samuel Kebis on 31/01/2023.
//

import SwiftUI

struct DayIndexView: View {
    var dayShift: Int
    var isSelected: Bool

    var body: some View {
        VStack(spacing: .dayIndexSelectorSpacingFromTop) {
            ZStack {
                Circle()
                    .foregroundColor(isSelected ? .blue : .gray)

                Text("\(dayShift)")
                    .foregroundColor(.white)
            }

            HStack {
                if isSelected {
                    Rectangle()
                }
            }
            .frame(height: .dayIndexSelectorHeight)
        }
    }
}

private extension CGFloat {
    static let dayIndexSelectorSpacingFromTop: CGFloat = 4
    static let dayIndexSelectorHeight: CGFloat = 8
}

// MARK: - Preview

struct DayIndexView_Previews: PreviewProvider {
    static var previews: some View {
        DayIndexView(dayShift: 5, isSelected: false)
            .frame(height: 100)
    }
}
