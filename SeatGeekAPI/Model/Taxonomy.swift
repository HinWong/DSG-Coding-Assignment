//
//  Taxonomy.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

// MARK: - Taxonomy
struct Taxonomy: Codable {
    let id: Int?
    let parentID: Int?
    let documentSource: DocumentSource?
    let rank: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case parentID
        case documentSource
        case rank
    }
}
