//
//  Discount.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/16.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct Discount: StripeModel {

    public let object: String
    public let coupon: Coupon?
    public let customer: String?
    public let end: TimeInterval
    public let start: TimeInterval
    public let subscription: String?
}
