//
//  PerformerStats.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

// MARK: - PerformerStats
struct PerformerStats: Codable {
    let eventCount: Int?

    enum CodingKeys: String, CodingKey {
        case eventCount
    }
}
