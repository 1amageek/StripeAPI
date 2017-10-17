//
//  Discount.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/16.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct Discount: Codable {

    let object: String
    let coupon: Coupon?
    let customer: String?
    let end: TimeInterval
    let start: TimeInterval
    let subscription: String?
}
