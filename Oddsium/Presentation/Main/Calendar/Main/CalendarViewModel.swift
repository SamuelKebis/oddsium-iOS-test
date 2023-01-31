//
//  CalendarViewModel.swift
//  Oddsium
//
//  Created by Samuel Kebis on 31/01/2023.
//

import SwiftUI

class CalendarViewModel: ObservableObject {
    @Published var selectedDay = 1
    let days: [(Color, Int)] = [(.green, 0), (.blue, 1), (.orange, 2), (.purple, 3)]
}
