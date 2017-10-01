//
//  Charge.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct Charge {

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
    let fraud_details: [AnyHashable: Any]
    let invoice: String?
    let livemode: Bool?
    let metadata: [AnyHashable: Any]
    let order: String?
    let outcome: Outcome
    let paid: Bool
    let receipt_email: String?
    let receipt_number: String?
    let refunded: Bool
    let refunds: List
    let review: String?
    //let shipping: Shipping
    let source: Card
    let source_transfer: String?
    let statement_descriptor: String?
    let status: String


    init?(_ object: [AnyHashable: Any]) {
        guard let id: String = object["id"] as? String else {
            return nil
        }
        guard let obj: String = object["object"] as? String else {
            return nil
        }
        guard let amount: Int = object["amount"] as? Int else {
            return nil
        }
        guard let amount_refunded: Int = object["amount_refunded"] as? Int else {
            return nil
        }
        guard let balance_transaction: String = object["balance_transaction"] as? String else {
            return nil
        }
        guard let captured: Bool = object["captured"] as? Bool else {
            return nil
        }
        guard let created: TimeInterval = object["created"] as? TimeInterval else {
            return nil
        }
        guard let currency: String = object["currency"] as? String else {
            return nil
        }
        self.customer = object["customer"] as? String
        self.description = object["description"] as? String
        guard let fraud_details: [AnyHashable: Any] = object["fraud_details"] as? [AnyHashable: Any] else {
            return nil
        }
        self.invoice = object["invoice"] as? String
        guard let livemode: Bool = object["livemode"] as? Bool else {
            return nil
        }
        guard let metadata: [AnyHashable: Any] = object["metadata"] as? [AnyHashable: Any] else {
            return nil
        }
        self.order = object["order"] as? String
        guard let outcome: [AnyHashable: Any] = object["outcome"] as? [AnyHashable: Any] else {
            return nil
        }
        guard let paid: Bool = object["paid"] as? Bool else {
            return nil
        }
        self.receipt_email = object["receipt_email"] as? String
        self.receipt_number = object["receipt_number"] as? String
        guard let refunded: Bool = object["refunded"] as? Bool else {
            return nil
        }
        guard let refunds:  [AnyHashable: Any] = object["refunds"] as?  [AnyHashable: Any] else {
            return nil
        }
        self.review = object["receipt_email"] as? String
        //            guard let shipping: [[AnyHashable: Any]] = object["shipping"] as? [[AnyHashable: Any]] else {
        //                return nil
        //            }
        guard let source: [AnyHashable: Any] = object["source"] as? [AnyHashable: Any] else {
            return nil
        }
        self.source_transfer = object["source_transfer"] as? String
        self.statement_descriptor = object["statement_descriptor"] as? String
        guard let status: String = object["status"] as? String else {
            return nil
        }

        self.id = id
        self.object = obj
        self.amount = amount
        self.amount_refunded = amount_refunded
        self.balance_transaction = balance_transaction
        self.captured = captured
        self.created = created
        self.currency = currency
        self.fraud_details = fraud_details
        self.livemode = livemode
        self.metadata = metadata
        self.outcome = Outcome(outcome)!
        self.paid = paid
        self.refunded = refunded
        self.refunds = List(refunds)!
        //                self.shipping
        self.source = Card(source)!
        self.status = status

    }
}
