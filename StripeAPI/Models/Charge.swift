//
//  Charge.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct Charge: Decodable {

    let id: String
    let object: String
    let amount: Int
    let amount_refunded: Int
    let balance_transaction: String
    let captured: Bool
    let created: TimeInterval
    let currency: String
    let customer: String?
    let description: String?
//    let fraud_details: [AnyHashable: Any]
    let invoice: String?
    let livemode: Bool?
//    let metadata: [AnyHashable: Any]
    let order: String?
    let outcome: Outcome
    let paid: Bool
    let receipt_email: String?
    let receipt_number: String?
    let refunded: Bool
    let refunds: String
    let review: String?
    let source: Card
    let source_transfer: String?
    let statement_descriptor: String?
    let status: String
}
