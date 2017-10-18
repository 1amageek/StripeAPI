//
//  Customer.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit
import Stripe

public struct Customer: StripeModel, ListProtocol {

    public static var path: String { return "/customers"}

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case accountBalance = "account_balance"
        case created
        case currency
        case defaultSource = "default_source"
        case delinquent
        case desc = "description"
        case discount
        case email
        case livemode
        case metadata
        case shipping
        case sources
        case subscriptions
    }

    public let id: String
    public let object: String
    public let accountBalance: Int
    public let created: TimeInterval
    public let currency: Currency?
    public let defaultSource: Source?
    public let delinquent: Bool
    public let desc: String?
    public let discount: Discount?
    public let email: String?
    public let livemode: Bool
    public let metadata: [String: String]?
    public let shipping: Shipping?
    public let sources: List<Source>?
    public let subscriptions: List<Subscription>?
}

extension Customer {

    // MARK: - Create

    public struct Create: StripeParametersAPI {

        public typealias Response = Customer

        public var method: HTTPMethod { return .post }

        public var path: String { return Customer.path }

        public var _parameters: Any?

        public init() {
            self._parameters = Paramaters()
        }

        public init(parameters: Paramaters) {
            self._parameters = parameters
        }

        public struct Paramaters: Codable {
            
            private enum CodingKeys: String, CodingKey {
                case accountBalance
                case businessVatID
                case coupon
                case defaultSource
                case description
                case email
                case metadata
                case shipping
                case source
            }

            public let accountBalance: Int? = nil
            public let businessVatID: String? = nil
            public let coupon: Coupon? = nil
            public let defaultSource: String? = nil
            public let description: String? = nil
            public let email: String? = nil
            public let metadata: [String: String]? = nil
            public let shipping: Shipping? = nil
            public let source: Source? = nil
        }
    }

    // MARK: - Retrieve

    public struct Retrieve: StripeAPI {

        public typealias Response = Customer

        public var method: HTTPMethod { return .get }

        public var path: String { return "/\(Customer.path)/\(id)" }

        public let id: String
    }

    // MARK: - Update

    public struct Update: StripeParametersAPI {

        public typealias Response = Customer

        public var method: HTTPMethod { return .post }

        public var path: String { return "/\(Customer.path)/\(id)" }

        public let id: String

        public var _parameters: Any?

        public init(id: String, parameters: Parameters) {
            self.id = id
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case accountBalance
                case businessVatID
                case coupon
                case defaultSource
                case description
                case email
                case metadata
                case shipping
                case source
            }

            public var accountBalance: Int? = nil
            public var businessVatID: String? = nil
            public var coupon: Coupon? = nil
            public var defaultSource: String? = nil
            public var description: String? = nil
            public var email: String? = nil
            public var metadata: [String: String]? = nil
            public var shipping: Shipping? = nil
            public var source: Source? = nil
        }
    }

    // MARK: - Delete

    public struct Delete: StripeAPI {

        public var method: HTTPMethod { return .delete }

        public var path: String { return "/\(Customer.path)/\(id)" }

        public let id: String

        public struct Response: Codable {
            public let deleted: Bool
            public let id: String
        }
    }
}
