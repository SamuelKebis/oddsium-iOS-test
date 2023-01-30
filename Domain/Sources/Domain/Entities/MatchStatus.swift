//
//  MatchStatus.swift
//  
//
//  Created by Samuel Kebis on 30/01/2023.
//

import Foundation

public enum MatchStatus: String, Decodable {
    case upcoming
    case live
    case completed
    case postponed
    case cancelled

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawString = try container.decode(String.self)
        guard let userType = MatchStatus(rawValue: rawString.lowercased()) else {
            let message = "Cannot initialize MatchStatus from invalid String value " + rawString
            throw DecodingError.dataCorruptedError(in: container, debugDescription: message)
        }
        self = userType
    }
}
