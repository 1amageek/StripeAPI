//
//  Coupon.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/16.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct Coupon: StripeModel {

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case amountOff = "amount_off"
        case created
        case currency
        case duration
        case durationInMonths = "duration_in_months"
        case livemode
        case maxRedemptions = "max_redemptions"
        case percentOff = "percent_off"
        case redeemBy = "redeem_by"
        case timesRedeemed = "times_redeemed"
        case valid
    }

    public enum Duration: String, StripeModel {
        case forever
        case once
        case repeating
    }

    public let id: String
    public let object: String
    public let amountOff: Int
    public let created: TimeInterval
    public let currency: Currency
    public let duration: Duration
    public let durationInMonths: Int?
    public let livemode: Bool
    public let maxRedemptions: Int?
    public let percentOff: Int?
    public let redeemBy: TimeInterval
    public let timesRedeemed: Int
    public let valid: Bool
}
