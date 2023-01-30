//
//  DefaultApiService.swift
//  
//
//  Created by Samuel Kebis on 30/01/2023.
//

import Foundation

public class DefaultApiService: ApiService {
    static let baseUrl = "https://psydreus.oddsium.com"

    public init() {}

    static func validateResponse(_ response: URLResponse?) -> Bool {
        guard let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            return false
        }

        return true
    }

    static func stringFromParameters(_ parameters: [(String, String)]) -> String {
        "?" + (parameters
            .map { "\($0)=\($1)" }
            .joined(separator: "&")
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
}
