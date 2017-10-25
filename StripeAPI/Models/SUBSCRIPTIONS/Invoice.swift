//
//  Invoice.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/25.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit

public struct Invoice: StripeModel, ListProtocol {

    public static var path: String { return "/invoices"}

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case amountDue = "amount_due"
        case applicationFee = "application_fee"
        case attemptCount = "attempt_count"
        case attempted
        case billing
        case charge
        case closed
        case currency
        case customer
        case date
        case description
        case discount
        case endingBalance = "ending_balance"
        case forgiven
        case lines
        case livemode
        case metadata
        case nextPaymentAttempt = "next_payment_attempt"
        case paid
        case periodEnd = "period_end"
        case periodStart = "period_start"
        case receiptNumber = "receipt_number"
        case startingBalance = "starting_balance"
        case statementDescriptor = "statement_descriptor"
        case subscription
        case subscriptionProrationDate = "subscription_proration_date"
        case subtotal
        case tax
        case taxPercent = "tax_percent"
        case total
        case webhooksDeliveredAt = "webhooks_delivered_at"
    }

    public let id: String
    public let object: String
    public let amountDue: Int
    public let applicationFee: Int?
    public let attemptCount: Int
    public let attempted: Bool
    public let billing: String
    public let charge: String
    public let closed: Bool
    public let currency: Currency
    public let customer: String
    public let date: TimeInterval
    public let description: String?
    public let discount: Discount?
    public let endingBalance: Int
    public let forgiven: Bool
    public let lines: List<LineItem>
    public let livemode: Bool
    public let metadata: [String: String]?
    public let nextPaymentAttempt: TimeInterval?
    public let paid: Bool
    public let periodEnd: TimeInterval
    public let periodStart: TimeInterval
    public let receiptNumber: String?
    public let startingBalance: Int
    public let statementDescriptor: String?
    public let subscription: String
    public let subscriptionProrationDate: Int?
    public let subtotal: Int
    public let tax: Int?
    public let taxPercent: Int?
    public let total: Int
    public let webhooksDeliveredAt: TimeInterval

    // MARK: -

    public struct LineItem: StripeModel {

        private enum CodingKeys: String, CodingKey {
            case id
            case object
            case amount
            case currency
            case description
            case discountable
            case livemode
            case metadata
            case period
            case plan
            case proration
            case quantity
            case subscription
            case type
        }

        public let id: String
        public let object: String
        public let amount: Int
        public let currency: Currency
        public let description: String
        public let discountable: Bool
        public let livemode: Bool
        public let metadata: [String: String]?
        public let period: Period
        public let plan: Plan?
        public let proration: Bool
        public let quantity: Int?
        public let subscription: String?
        public let type: LineItemType

        public struct Period: Codable {

            public let start: TimeInterval
            public let end: TimeInterval
        }

        public enum LineItemType: String, Codable {
            case invoiceitem
            case subscription
        }
    }
}

extension Invoice {

    // MARK: - Create

    public struct Create: StripeParametersAPI {

        public typealias Response = Invoice

        public var method: HTTPMethod { return .post }

        public var path: String { return Invoice.path }

        public var _parameters: Any?

        public init(customerID: String, daysUntilDue: Int) {
            self._parameters = Parameters(customerID: customerID, daysUntilDue: daysUntilDue)
        }

        public init(customerID: String, dueDate: TimeInterval) {
            self._parameters = Parameters(customerID: customerID, dueDate: dueDate)
        }

        public init(parameters: Parameters) {
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case customer
                case applicationFee = "application_fee"
                case billing
                case daysUntilDue = "days_until_due"
                case description
                case dueDate = "due_date"
                case metadata
                case statementDescriptor = "statement_descriptor"
                case subscription
                case taxPercent = "tax_percent"
            }

            public let customer: String
            public var applicationFee: Int? = nil
            public var billing: Billing? = nil
            public var daysUntilDue: Int? = nil
            public var description: String? = nil
            public var dueDate: TimeInterval? = nil
            public var metadata: [String: String]? = nil
            public var statementDescriptor: String? = nil
            public var subscription: String? = nil
            public var taxPercent: Int? = nil

            public init(customerID: String, daysUntilDue: Int) {
                self.customer = customerID
                self.billing = .sendInvoice
                self.daysUntilDue = daysUntilDue
            }

            public init(customerID: String, dueDate: TimeInterval) {
                self.customer = customerID
                self.billing = .chargeAutomatically
                self.dueDate = dueDate
            }

            public enum Billing: String, Codable {
                case chargeAutomatically = "charge_automatically"
                case sendInvoice = "send_invoice"
            }
        }
    }

    // MARK: - Retrieve

    public struct Retrieve: StripeAPI {

        public typealias Response = Invoice

        public var method: HTTPMethod { return .get }

        public var path: String { return "\(Invoice.path)/\(id)" }

        public let id: String
    }

    // MARK: - Update

    public struct Update: StripeParametersAPI {

        public typealias Response = Invoice

        public var method: HTTPMethod { return .post }

        public var path: String { return "\(Invoice.path)/\(id)" }

        public let id: String

        public var _parameters: Any?

        public init(id: String, parameters: Parameters) {
            self.id = id
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case applicationFee = "application_fee"
                case closed
                case description
                case forgiven
                case metadata
                case paid
                case statementDescriptor = "statement_descriptor"
                case taxPercent = "tax_percent"
            }

            public var applicationFee: Int? = nil
            public var closed: Bool? = nil
            public var description: String? = nil
            public var forgiven: Bool? = nil
            public var metadata: [String: String]? = nil
            public var paid: Bool? = nil
            public var statementDescriptor: String? = nil
            public var taxPercent: Int? = nil
        }
    }

    // MARK: - Pay

    public struct Pay: StripeParametersAPI {

        public typealias Response = Invoice

        public var method: HTTPMethod { return .post }

        public var path: String { return "\(Invoice.path)/\(id)/pay" }

        public var _parameters: Any?

        public let id: String

        public init(id: String) {
            self.id = id
            self._parameters = Parameters()
        }

        public init(id: String, parameters: Parameters) {
            self.id = id
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            public var source: String? = nil
        }
    }
}
