//
//  File.swift
//  
//
//  Created by Samuel Kebis on 01/02/2023.
//

import Combine
import Domain
import Foundation
import Network
import ShortcutFoundation

public class DataProvider: ObservableObject {
    @Inject var apiService: ApiService

    @Published public var dayData: [Int: DayData] = [:]

    var activeRequests: [Int] = []
    var cancellables = Set<AnyCancellable>()

    public init() {}

    public func getDataFor(_ dateOffset: Int) {
        guard !activeRequests.contains(dateOffset) else {
            return
        }

        activeRequests.append(dateOffset)

        let date = Date(dayOffset: dateOffset)
        let dateString = date.asString(.apiRequest)

        apiService
            .fetchMatches(
                date: dateString,
                sport: .defaultSport,
                countryCode: .defaultCountryCode,
                timeZone: .defaultTimeZone
            )
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in
            }, receiveValue: { [weak self] data in
                self?.dayData[dateOffset] = data
            })
            .store(in: &cancellables)
    }
}

private extension String {
    static let defaultCountryCode = "SE"
    static let defaultTimeZone = "europe/stockholm"
}

private extension Int {
    static let defaultSport = 1
}
