//
//  Inventory.swift
//  StripeAPI
//
//  Created by nori on 2017/10/16.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct Inventory: Codable {
    public enum InventoryType: String, Codable {
        case finite, bucket, infinite
    }

    public enum BucketValue: String, Codable {
        case limited, out_of_stock, in_stock
    }

    public let quantity: Int?
    public let type: InventoryType
    public let value: BucketValue?
}
