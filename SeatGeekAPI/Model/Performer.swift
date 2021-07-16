//
//  Performer.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

// MARK: - Performer
struct Performer: Codable {
    //let type: PerformerType?
    let name: String?
    let image: String?
    let id: Int?
    let images: PerformerImages?
    let divisions: [Division]?
    let hasUpcomingEvents: Bool?
    let primary: Bool?
    let stats: PerformerStats?
    let taxonomies: [Taxonomy]?
    let imageAttribution: String?
    let url: String?
    let score: Double?
    let slug: String?
    let homeVenueID: Int?
    let shortName: String?
    let numUpcomingEvents: Int?
    let colors: JSONNull?
    let imageLicense: String?
    let genres: [Genre]?
    let popularity: Int?
    let location: Location?
    let homeTeam, awayTeam: Bool?

    enum CodingKeys: String, CodingKey {
        //case type
        case name, image, id, images, divisions
        case hasUpcomingEvents
        case primary, stats, taxonomies
        case imageAttribution
        case url, score, slug
        case homeVenueID
        case shortName
        case numUpcomingEvents
        case colors
        case imageLicense
        case genres, popularity, location
        case homeTeam
        case awayTeam
    }
}
