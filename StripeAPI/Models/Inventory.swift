//
//  Inventory.swift
//  StripeAPI
//
//  Created by nori on 2017/10/16.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct Inventory: Decodable {
    enum InventoryType: String, Decodable {
        case finite, bucket, infinite
    }

    enum BucketValue: String, Decodable {
        case limited, out_of_stock, in_stock
    }

    let quantity: Int?
    let type: InventoryType
    let value: BucketValue?
}
