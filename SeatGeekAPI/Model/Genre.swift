//
//  Genre.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name, slug: String?
    let primary: Bool?
    let images: GenreImages?
    let image: String?
    let documentSource: DocumentSource?

    enum CodingKeys: String, CodingKey {
        case id, name, slug, primary, images, image
        case documentSource
    }
}
