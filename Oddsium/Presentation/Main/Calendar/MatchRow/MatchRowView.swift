//
//  MatchRowView.swift
//  Oddsium
//
//  Created by Samuel Kebis on 01/02/2023.
//

import Domain
import SwiftUI

struct MatchRowView: View {
    // swiftlint:disable:next identifier_name
    let vm: MatchRowViewModel

    init(match: Match) {
        self.vm = .init(match: match)
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.gray)

            VStack {
                Text(vm.title)

                Text(vm.date)

                Text(vm.description)
            }
        }
        .frame(maxWidth: .infinity)
    }
}
