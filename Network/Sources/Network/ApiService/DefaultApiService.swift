//
//  DefaultApiService.swift
//  
//
//  Created by Samuel Kebis on 30/01/2023.
//

import Foundation

public class DefaultApiService: ApiService {
    static let scheme = "https"
    static let host = "psydreus.oddsium.com"

    public init() {}

    static func validateResponse(_ response: URLResponse?) -> Bool {
        guard let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            return false
        }

        return true
    }
}
