//
//  FetchMatches.swift
//  
//
//  Created by Samuel Kebis on 30/01/2023.
//

import Combine
import Domain
import Foundation

extension DefaultApiService {
    public func fetchMatches(
        date: String,
        sport: Int,
        countryCode: String,
        timeZone: String
    ) -> AnyPublisher<DayData, Error> {
        var components = URLComponents()
        components.scheme = DefaultApiService.scheme
        components.host = DefaultApiService.host
        components.path = "/matches"
        components.queryItems = [
            .init(name: "date", value: date),
            .init(name: "sport", value: String(sport)),
            .init(name: "countrycode", value: countryCode),
            .init(name: "timezone", value: timeZone)
        ]

        guard let url = components.url else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard DefaultApiService.validateResponse(response) else {
                    throw NetworkError.invalidResponse
                }

                return data
            }
            .decode(type: DayData.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
