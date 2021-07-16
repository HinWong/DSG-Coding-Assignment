//
//  Division.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

// MARK: - Division
struct Division: Codable {
    let taxonomyID: Int?
    let shortName: String?
    let displayName, displayType: String?
    let divisionLevel: Int?
    let slug: String?

    enum CodingKeys: String, CodingKey {
        case taxonomyID
        case shortName
        case displayName
        case displayType
        case divisionLevel
        case slug
    }
}
