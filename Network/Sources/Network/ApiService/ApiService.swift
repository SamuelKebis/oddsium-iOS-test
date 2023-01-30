//
//  ApiService.swift
//  
//
//  Created by Samuel Kebis on 30/01/2023.
//

import Combine
import Domain

public protocol ApiService {
    func fetchMatches(date: String, sport: Int, countryCode: String, timeZone: String) -> AnyPublisher<DayData, Error>
}
