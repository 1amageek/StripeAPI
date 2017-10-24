//
//  Charge.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit

public struct Charge: StripeModel, ListProtocol {

    public static var path: String { return "/products"}

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case amount
        case amountRefunded = "amount_refunded"
        case application
        case applicationFee = "application_fee"
        case balanceTransaction = "balance_transaction"
        case captured
        case created
        case currency
        case customer
        case description
        case destination
        case dispute
        case failureCode = "failure_code"
        case failureMessage = "failure_message"
        case fraudDetails = "fraud_details"
        case invoice
        case livemode
        case metadata
        case onBehalfOf = "on_behalf_of"
        case order
        case outcome
        case paid
        case receiptEmail = "receipt_email"
        case receiptNumber = "receipt_number"
        case refunded
        case refunds
        case review
        case shipping
        case source
        case sourceTransfer = "source_transfer"
        case statementDescriptor = "statement_descriptor"
        case status
        case transferGroup = "transfer_group"
    }

    public let id: String
    public let object: String
    public let amount: Double
    public let amountRefunded: Double
    public let application: String?
    public let applicationFee: String?
    public let balanceTransaction: String
    public let captured: Bool
    public let created: TimeInterval
    public let currency: Currency
    public let customer: String
    public let description: String?
    public let destination: String?
    public let dispute: String
    public let failureCode: String?
    public let failureMessage: String?
    public let fraudDetails: FraudDetails
    public let invoice: String
    public let livemode: Bool
    public let metadata: [String: String]?
    public let onBehalfOf: String?
    public let order: String?
    public let outcome: Outcome
    public let paid: Bool
    public let receiptEmail: String?
    public let receiptNumber: String?
    public let refunded: Bool?
    public let refunds: List<Refund>
    public let review: String?
    public let shipping: Shipping
    public let source: Card
    public let sourceTransfer: String?
    public let statementDescriptor: String?
    public let status: Status
    public let transferGroup: String?

    public enum Status: String, Codable {
        case succeeded
        case pending
        case failed
    }

    public struct FraudDetails: Codable {

        private enum CodingKeys: String, CodingKey {
            case userReport = "user_report"
            case stripeReport = "stripe_report"
        }

        public let userReport: UserReport?
        public let stripeReport: StripeReport?

        public enum UserReport: String, Codable {
            case safe
            case fraudulent
        }

        public enum StripeReport: String, Codable {
            case fraudulent
        }
    }


}

extension Charge {

    // MARK: - Create

    public struct Create: StripeParametersAPI {

        public typealias Response = Charge

        public var method: HTTPMethod { return .post }

        public var path: String { return Charge.path }

        public var _parameters: Any?

        public init(amount: Double, currency: Currency, customer: String) {
            self._parameters = Parameters(amount: amount, currency: currency, customer: customer)
        }

        public init(amount: Double, currency: Currency, source: String) {
            self._parameters = Parameters(amount: amount, currency: currency, source: source)
        }

        public init(parameters: Parameters) {
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case amount
                case currency
                case applicationFee = "application_fee"
                case capture
                case description
                case destination
                case transferGroup = "transfer_group"
                case onBehalfOf = "on_behalf_of"
                case metadata
                case receiptEmail = "receipt_email"
                case shipping
                case customer
                case source
                case statementDescriptor = "statement_descriptor"
            }

            public let amount: Double
            public let currency: Currency
            public var applicationFee: String? = nil
            public var capture: Bool? = nil
            public var description: String? = nil
            public var destination: Destination? = nil
            public var transferGroup: String? = nil
            public var onBehalfOf: String? = nil
            public var metadata: [String: String]? = nil
            public var receiptEmail: String? = nil
            public var shipping: Shipping? = nil
            public let customer: String?
            public let source: String?
            public var statementDescriptor: String? = nil

            public init(amount: Double, currency: Currency, customer: String) {
                self.amount = amount
                self.currency = currency
                self.customer = customer
                self.source = nil
            }

            public init(amount: Double, currency: Currency, source: String) {
                self.amount = amount
                self.currency = currency
                self.customer = nil
                self.source = source
            }

            public struct Destination: Codable {

                public let account: String
                public var amount: Double? = nil
            }
        }
    }

    // MARK: - Retrieve

    public struct Retrieve: StripeAPI {

        public typealias Response = Charge

        public var method: HTTPMethod { return .get }

        public var path: String { return "\(Charge.path)/\(id)" }

        public let id: String
    }

    // MARK: - Update

    public struct Update: StripeParametersAPI {

        public typealias Response = Charge

        public var method: HTTPMethod { return .post }

        public var path: String { return "\(Charge.path)/\(id)" }

        public let id: String

        public var _parameters: Any?

        public init(id: String, parameters: Parameters) {
            self.id = id
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case description
                case fraudDetails = "fraud_details"
                case metadata
                case receiptEmail = "receipt_email"
                case shipping
                case transferGroup = "transfer_group"
            }

            public let description: String? = nil
            public let fraudDetails: FraudDetails? = nil
            public let metadata: [String: String]? = nil
            public let receiptEmail: String? = nil
            public let shipping: Shipping? = nil
            public let transferGroup: String? = nil
        }
    }
}
