//
//  SKU.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct SKU: Decodable {
    let id: String
    let created: TimeInterval
    let updated: TimeInterval
    let price: Int
    let currency: String
    let livemode: Bool
    let product: String
}
