//
//  Venue.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

// MARK: - Venue
struct Venue: Codable {
    let state, name: String?
    let postalCode: String?
    let nameV2: String?
    let links: [JSONAny]?
    let url: String?
    let score: Double?
    let location: Location?
    let address: String?
    let hasUpcomingEvents: Bool?
    let numUpcomingEvents: Int?
    let city, slug, extendedAddress: String?
    let id, popularity: Int?
    let accessMethod: JSONNull?
    let metroCode, capacity: Int?
    let displayLocation: String?

    enum CodingKeys: String, CodingKey {
        case state
        case nameV2
        case postalCode
        case name, links, url, score, location, address
        case hasUpcomingEvents
        case numUpcomingEvents
        case city, slug
        case extendedAddress
        case id, popularity
        case accessMethod
        case metroCode
        case capacity
        case displayLocation
    }
}
