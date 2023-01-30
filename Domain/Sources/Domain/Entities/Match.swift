//
//  Match.swift
//  
//
//  Created by Samuel Kebis on 30/01/2023.
//

import Foundation

public struct Match: Decodable {
    public let id: Int
    public let name: String
    public let date: String
    public let tournamentID: Int?
    public let tournamentName: String?
    public let tournamentFlagURL: String?
    public let status: MatchStatus
    public let liveStatus: String?
    public let htName: String?
    public let htID: Int?
    public let htFlagURL: String?
    public let atName: String?
    public let atID: Int?
    public let atFlagURL: String?
    public let score: Score
    public let sportID: Int?
    public let hasHighlights: Bool?
    public let hasStream: Bool?
    public let reversible: Bool
}
