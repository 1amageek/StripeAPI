//
//  Inventory.swift
//  StripeAPI
//
//  Created by nori on 2017/10/16.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct Inventory: StripeModel {

    public enum InventoryType: String, StripeModel {
        case finite, bucket, infinite
    }

    public enum BucketValue: String, StripeModel {
        case limited, out_of_stock, in_stock
    }

    public let quantity: Int?
    public let type: InventoryType
    public let value: BucketValue?
}
