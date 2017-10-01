//
//  SKU.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct SKU {
    let currency: String
    let price: Int

    init?(_ json: [AnyHashable: Any]) {
        guard
            let currency = json["currency"] as? String,
            let price = json["price"] as? Int else
        {
            return nil
        }

        self.currency = currency
        self.price = price
    }
}
