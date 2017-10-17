//
//  Order.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct Order: Codable {

    public let id: String
    public let object: String
    public let amount: Int
    public let amount_returned: Int?
//    let application: null
//    let application_fee: null
    public let charge: Charge
    public let created: TimeInterval
    public let currency: String
    public let customer: Customer
    public let email: String?
//    let items: [Any]
    public let livemode: Bool
    public let selected_shipping_method: String
    public let status: String
    public let updated: TimeInterval

}
