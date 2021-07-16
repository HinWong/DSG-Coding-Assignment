//
//  EventStats.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

// MARK: - EventStats
struct EventStats: Codable {
    let listingCount, averagePrice, lowestPriceGoodDeals, lowestPrice: Int?
    let highestPrice, visibleListingCount: Int?
    let dqBucketCounts: [Int]?
    let medianPrice, lowestSgBasePrice, lowestSgBasePriceGoodDeals: Int?

    enum CodingKeys: String, CodingKey {
        case listingCount
        case averagePrice
        case lowestPriceGoodDeals
        case lowestPrice
        case highestPrice
        case visibleListingCount
        case dqBucketCounts
        case medianPrice
        case lowestSgBasePrice
        case lowestSgBasePriceGoodDeals
    }
}
