//
//  DayIndexView.swift
//  Oddsium
//
//  Created by Samuel Kebis on 31/01/2023.
//

import SwiftUI

struct DayIndexView: View {
    // swiftlint:disable:next identifier_name
    let vm: DayIndexViewModel

    init(dayOffset: Int, isSelected: Bool) {
        vm = .init(dayOffset: dayOffset, isSelected: isSelected)
    }

    var body: some View {
        VStack(spacing: .dayIndexSelectorSpacingFromTop) {
            ZStack {
                Circle()
                    .foregroundColor(vm.isSelected ? .blue : .gray)

                Text("\(vm.dayOffset)")
                    .foregroundColor(.white)
            }

            Text(vm.title)
                .foregroundColor(.gray)

            Text(vm.subtitle)
                .foregroundColor(.gray)

            HStack {
                if vm.isSelected {
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
        DayIndexView(dayOffset: 5, isSelected: false)
            .frame(height: 100)
    }
}
