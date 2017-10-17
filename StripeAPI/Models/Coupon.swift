//
//  Coupon.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/16.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct Coupon: Codable {

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

    enum Duration: String, Codable {
        case forever
        case once
        case repeating
    }

    let id: String
    let object: String
    let amountOff: Int
    let created: TimeInterval
    let currency: Currency
    let duration: Duration
    let durationInMonths: Int?
    let livemode: Bool
    let maxRedemptions: Int?
    let percentOff: Int?
    let redeemBy: TimeInterval
    let timesRedeemed: Int
    let valid: Bool
}
