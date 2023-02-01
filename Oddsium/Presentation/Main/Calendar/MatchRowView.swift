//
//  MatchRowView.swift
//  Oddsium
//
//  Created by Samuel Kebis on 01/02/2023.
//

import Domain
import SwiftUI

struct MatchRowView: View {
    let match: Match

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.gray)

            VStack {
                Text(match.name)

                Text(match.date)

                Text(match.status.rawValue)
            }
        }
        .frame(maxWidth: .infinity)
    }
}
