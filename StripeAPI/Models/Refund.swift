//
//  Refund.swift
//  StripeAPI
//
//  Created by nori on 2017/10/18.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit

public struct Refund: StripeModel, ListProtocol {
    
    public static var path: String { return "/refunds" }

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case amount
        case balanceTransaction = "balance_transaction"
        case charge
        case created
        case currency
        case metadata
        case reason
        case receiptNumber = "receipt_number"
        case status
    }

    public enum Status: String, StripeModel {
        case succeeded
        case failed
        case pending
        case cancelled
    }

    public let id: String
    public let object: String
    public let amount: Int
    public let balanceTransaction: String?
    public let charge: String
    public let created: TimeInterval
    public let currency: Currency
    public let metadata: [String: String]
    public let reason: String
    public let receiptNumber: String
    public let status: Status
}

extension Refund {

    // MARK: - Create

    public struct Create: StripeParametersAPI {

        public typealias Response = Refund

        public var method: HTTPMethod { return .post }

        public var path: String { return Refund.path }

        public var _parameters: Any?

        public init(charge: String) {
            self._parameters = Parameters(charge: charge)
        }

        public init(parameters: Parameters) {
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case charge
                case amount
                case metadata
                case reason
                case refundApplicationFee = "refund_application_fee"
                case reverseTransfer = "reverse_transfer"
            }

            public enum Reason: String, Codable {
                case duplicate
                case fraudulent
                case requestedByCustomer = "requested_by_customer"
            }

            public init(charge: String) {
                self.charge = charge
            }

            public let charge: String
            public var amount: Int? = nil
            public var metadata: [String: String]? = nil
            public var reason: Reason? = nil
            public var refundApplicationFee: Bool? = nil
            public var reverseTransfer: Bool? = nil
        }
    }

    // MARK: - Retrieve

    public struct Retrieve: StripeAPI {

        public typealias Response = Refund

        public var method: HTTPMethod { return .get }

        public var path: String { return "\(Refund.path)/\(id)" }

        public let id: String
    }

    // MARK: - Update

    public struct Update: StripeParametersAPI {

        public typealias Response = Refund

        public var method: HTTPMethod { return .post }

        public var path: String { return "\(Refund.path)/\(id)" }

        public let id: String

        public var _parameters: Any?

        public init(id: String, parameters: Parameters) {
            self.id = id
            self._parameters = parameters
        }

        public struct Parameters: Codable {
            public var metadata: [String: String]? = nil
        }
    }
}
