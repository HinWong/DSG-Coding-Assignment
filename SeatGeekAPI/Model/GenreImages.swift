//
//  GenreImages.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

// MARK: - GenreImages
struct GenreImages: Codable {
    let the1200X525, the1200X627, the136X136, the500_700: String?
    let the800X320, banner, block, criteo130_160: String?
    let criteo170_235, criteo205_100, criteo400_300, fb100X72: String?
    let fb600_315, huge, ipadEventModal, ipadHeader: String?
    let ipadMiniExplore, mongo, squareMid, triggitFbAd: String?

    enum CodingKeys: String, CodingKey {
        case the1200X525
        case the1200X627
        case the136X136
        case the500_700
        case the800X320
        case banner, block
        case criteo130_160
        case criteo170_235
        case criteo205_100
        case criteo400_300
        case fb100X72
        case fb600_315
        case huge
        case ipadEventModal
        case ipadHeader
        case ipadMiniExplore
        case mongo
        case squareMid
        case triggitFbAd
    }
}
