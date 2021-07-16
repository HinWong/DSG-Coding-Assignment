//
//  DocumentSource.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

// MARK: - DocumentSource
struct DocumentSource: Codable {
    let sourceType: SourceType?
    let generationType: GenerationType?

    enum CodingKeys: String, CodingKey {
        case sourceType
        case generationType
    }
}

enum GenerationType: String, Codable {
    case full = "FULL"
}

enum SourceType: String, Codable {
    case elastic = "ELASTIC"
}
