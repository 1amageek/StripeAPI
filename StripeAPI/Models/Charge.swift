//
//  Charge.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct Charge: Codable {

    public let id: String
    public let object: String
    public let amount: Int
    public let amount_refunded: Int
    public let balance_transaction: String
    public let captured: Bool
    public let created: TimeInterval
    public let currency: String
    public let customer: String?
    public let description: String?
//    let fraud_details: [AnyHashable: Any]
    public let invoice: String?
    public let livemode: Bool?
//    let metadata: [AnyHashable: Any]
    public let order: String?
    public let outcome: Outcome
    public let paid: Bool
    public let receipt_email: String?
    public let receipt_number: String?
    public let refunded: Bool
    public let refunds: String
    public let review: String?
    public let source: Card
    public let source_transfer: String?
    public let statement_descriptor: String?
    public let status: String
}
