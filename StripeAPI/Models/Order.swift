//
//  Order.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

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

    public struct statusTransitions: StripeModel {
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

    public let id: String
    public let object: String
    public let amount: Int
    public let amountReturned: Int?
    public let application: String?
    public let applicationFee: Int?
    public let charge: String?
    public let created: TimeInterval
    public let currency: Currency
    public let customer: String
    public let email: String?
    public let items: [OrderItem]
    public let livemode: Bool
    public let metadata: [String: String]
    public let returns: List<OrderItem>
    public let selectedShippingMethod: String
    public let shipping: Shipping
    public let shippingMethods: [ShippingMethod]
    public let status:  Status
    public let statusTransitions: statusTransitions
    public let updated: TimeInterval
}

