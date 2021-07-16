//
//  Meta.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

// MARK: - Meta
struct Meta: Codable {
    let total, took, page, perPage: Int?
    let geolocation: JSONNull?

    enum CodingKeys: String, CodingKey {
        case total, took, page
        case perPage
        case geolocation
    }
}
