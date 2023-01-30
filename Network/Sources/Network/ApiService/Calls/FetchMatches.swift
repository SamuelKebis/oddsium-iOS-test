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
        let parametersDictionary: [(String, String)] = [
            ("date", date),
            ("sport", String(sport)),
            ("countrycode", countryCode),
            ("timezone", timeZone)
        ]
        let parameters = DefaultApiService.stringFromParameters(parametersDictionary)
        let urlString = DefaultApiService.baseUrl + "/matches?" + parameters

        guard let url = URL(string: urlString) else {
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
