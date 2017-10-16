//
//  Product.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct Product: Decodable {
    let id: String
    let object: String
    let active: Bool
    let attributes: [String]
    let caption: String
    let created: TimeInterval
    //        let deactivate_on: [?]
    let description: String?
    let images: [URL]
    let livemode: Bool
    let metadata: [String: String]
    let name: String
    let packageDimensions: PackageDimensions
    let shippable: Bool
    let skus: List<SKU>
    let updated: TimeInterval
    let url: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case active
        case attributes
        case caption
        case created
        case description
        case images
        case livemode
        case metadata
        case name
        case packageDimensions = "package_dimensions"
        case shippable
        case skus
        case updated
        case url
    }
}
