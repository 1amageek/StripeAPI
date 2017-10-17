//
//  Order.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct Order: Codable {

    let id: String
    let object: String
    let amount: Int
    let amount_returned: Int?
//    let application: null
//    let application_fee: null
    let charge: Charge
    let created: TimeInterval
    let currency: String
    let customer: Customer
    let email: String?
//    let items: [Any]
    let livemode: Bool
    let selected_shipping_method: String
    let status: String
    let updated: TimeInterval

}
