//
//  SKU.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct SKU: StripeModel {

    public static var path: String { return "/skus"}

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
        case metadata
        case packageDimensions = "package_dimensions"
        case price
        case product
        case updated
    }

    public let id: String
    public let object: String
    public let active: Bool
    public let attributes: [String: String]
    public let created: TimeInterval
    public let currency: String
    public let image: URL?
    public let inventory: Inventory
    public let livemode: Bool
    public let metadata: [String: String]
    public let packageDimensions: PackageDimensions?
    public let price: Int
    public let product: String
    public let updated: TimeInterval
}
