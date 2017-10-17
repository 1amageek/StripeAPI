//
//  Product.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct Product: Codable {
    public let id: String
    public let object: String
    public let active: Bool
    public let attributes: [String]
    public let caption: String
    public let created: TimeInterval
    //        let deactivate_on: [?]
    public let description: String?
    public let images: [URL]
    public let livemode: Bool
    public let metadata: [String: String]
    public let name: String
    public let packageDimensions: PackageDimensions
    public let shippable: Bool
    public let skus: List<SKU>
    public let updated: TimeInterval
    public let url: String?

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
