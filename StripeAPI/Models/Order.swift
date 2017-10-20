//
//  Order.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit

public struct Order: StripeModel, ListProtocol {

    public static var path: String { return "/orders"}

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case amount
        case amountReturned = "amount_returned"
        case application
        case applicationFee = "application_fee"
        case charge
        case created
        case currency
        case customer
        case email
        case items
        case livemode
        case metadata
        case returns
        case selectedShippingMethod = "selected_shipping_method"
        case shipping
        case shippingMethods = "shipping_methods"
        case status
        case statusTransitions = "status_transitions"
        case updated
    }

    public let id: String
    public let object: String
    public let amount: Int
    public let amountReturned: Int?
    public let application: String?
    public let applicationFee: Int?
    public let charge: String?
    public let created: TimeInterval
    public let currency: Currency
    public let customer: String?
    public let email: String?
    public let items: [OrderItem]
    public let livemode: Bool
    public let metadata: [String: String]
    public let returns: List<OrderItem>
    public let selectedShippingMethod: String
    public let shipping: Shipping
    public let shippingMethods: [ShippingMethod]
    public let status:  Status
    public let statusTransitions: StatusTransitions
    public let updated: TimeInterval

    // MARK: -

    public struct StatusTransitions: StripeModel {
        public let canceled: TimeInterval?
        public let fulfiled: TimeInterval?
        public let paid: TimeInterval?
        public let returned: TimeInterval?
    }

    public enum Status: String, StripeModel {
        case created
        case paid
        case canceled
        case fulfilled
        case returned
    }
}

extension Order {

    // MARK: - Create

    public struct Create: StripeParametersAPI {

        public typealias Response = Order

        public var method: HTTPMethod { return .post }

        public var path: String { return Order.path }

        public var _parameters: Any?

        public init(currentcy: Currency) {
            self._parameters = Parameters(currency: currentcy)
        }

        public init(parameters: Parameters) {
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case currency
                case coupon
                case customer
                case email
                case items
                case metadata
                case shipping
            }

            public let currency: Currency
            public var coupon: Coupon? = nil
            public var customer: String? = nil
            public var email: String? = nil
            public var items: [Parameters.OrderItem]? = nil
            public var metadata: [String: String]? = nil
            public var shipping: Shipping? = nil

            public init(currency: Currency) {
                self.currency = currency
            }

            public struct OrderItem: Codable {

                public enum ItemType: String, Codable {
                    case sku
                    case tax
                    case shipping
                    case discount
                }

                public var amount: Int? = nil
                public var currency: Currency? = nil
                public var description: String? = nil
                public var parent: String? = nil
                public var quantity: Int? = nil
                public var type: ItemType

                public init(type: ItemType, parent: String?) {
                    self.type = type
                    self.parent = parent
                }
            }
        }
    }

    // MARK: - Retrieve

    public struct Retrieve: StripeAPI {

        public typealias Response = Order

        public var method: HTTPMethod { return .get }

        public var path: String { return "\(Order.path)/\(id)" }

        public let id: String
    }

    // MARK: - Update

    public struct Update: StripeParametersAPI {

        public typealias Response = Order

        public var method: HTTPMethod { return .post }

        public var path: String { return "\(Order.path)/\(id)" }

        public let id: String

        public var _parameters: Any?

        public init(id: String, parameters: Parameters) {
            self.id = id
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case coupon
                case metadata
                case selectedShippingMethod = "selected_shipping_method"
                case shipping
                case status
            }

            public var coupon: Coupon? = nil
            public var metadata: [String: String]? = nil
            public var selectedShippingMethod: String? = nil
            public var shipping: Shipping? = nil
            public var status: Order.Status? = nil
        }
    }

    // MARK: - Pay

    public struct Pay: StripeParametersAPI {

        public typealias Response = Order

        public var method: HTTPMethod { return .post }

        public var path: String { return "\(Order.path)/\(id)/pay" }

        public var _parameters: Any?

        public let id: String

        public init(id: String, customer: String) {
            self.id = id
            self._parameters = Parameters(customer: customer)
        }

        public init(id: String, source: String, email: String) {
            self.id = id
            self._parameters = Parameters(source: source, email: email)
        }

        public init(id: String, parameters: Parameters) {
            self.id = id
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case customer
                case source
                case applicationFee = "application_fee"
                case email
                case metadata
            }

            public init(customer: String) {
                self.customer = customer
            }

            public init(source: String, email: String) {
                self.source = source
                self.email = email
            }

            public var customer: String? = nil
            public var source: String? = nil
            public var applicationFee: ApplicationFee? = nil
            public var email: String? = nil
            public var metadata: [String: String]? = nil
        }
    }

    // MARK: - Return

    public struct Return: StripeAPI {

        public typealias Response = Order

        public var method: HTTPMethod { return .post }

        public var path: String { return "\(Order.path)/\(id)/return" }

        public var _parameters: Any?

        public let id: String

        public init(id: String, items: [Parameters.Item]) {
            self.id = id
            self._parameters = Parameters(items: items)
        }

        public init(id: String, parameters: Parameters) {
            self.id = id
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            public struct Item: Codable {

                public enum ItemType: String, Codable {
                    case sku
                    case tax
                    case shipping
                }

                public let amount: Int?
                public let description: String?
                public let parent: String?
                public let quantity: Int?
                public let type: ItemType
            }

            public init(items: [Item]) {
                self.items = items
            }

            public var items: [Item]? = nil
        }
    }
}

