//
//  ApplicationFee.swift
//  StripeAPI
//
//  Created by nori on 2017/10/18.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit

public struct ApplicationFee: StripeModel, ListProtocol {

    public static var path: String { return "/application_fees" }

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case account
        case amount
        case amountRefunded = "amount_refunded"
        case application
        case balanceTransaction = "balance_transaction"
        case charge
        case created
        case currency
        case livemode
        case originatingTransaction = "originating_transaction"
        case refunded
        case refunds
    }

    public let id: String
    public let object: String
    public let account: String
    public let amount: Int
    public let amountRefunded: Int
    public let application: String
    public let balanceTransaction: String
    public let charge: String
    public let created: TimeInterval
    public let currency: Currency
    public let livemode: Bool
    public let originatingTransaction: String?
    public let refunded: Bool
    public let refunds: List<Refund>
}

extension ApplicationFee {

    // MARK: - Retrieve

    public struct Retrieve: StripeAPI {

        public typealias Response = ApplicationFee

        public var method: HTTPMethod { return .get }

        public var path: String { return "\(ApplicationFee.path)/\(id)" }

        public let id: String

        public init(id: String) {
            self.id = id
        }
    }
}
