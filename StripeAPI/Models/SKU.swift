//
//  SKU.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct SKU: Codable {

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case active
        case attributes
        case created
        case currency
        case image
        case inventory
        case livemode
        case packageDimensions = "package_dimensions"
        case price
        case product
        case updated
    }

    let id: String
    let object: String
    let active: Bool
    let attributes: [String: String]
    let created: TimeInterval
    let currency: String
    let image: URL?
    let inventory: Inventory
    let livemode: Bool
    //        let metadata: [:]
    let packageDimensions: PackageDimensions?
    let price: Int
    let product: String
    let updated: TimeInterval
}
