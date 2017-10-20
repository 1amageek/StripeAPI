//
//  Return.swift
//  StripeAPI
//
//  Created by nori on 2017/10/20.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit

public struct Return: StripeModel, ListProtocol {

    public static var path: String { return "/returns"}

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case amount
        case created
        case currency
        case items
        case livemode
        case order
        case refund
    }

    public let id: String
    public let object: String
    public let amount: Int
    public let created: TimeInterval
    public let currency: Currency
    public let items: [OrderItem]
    public let livemode: Bool
    public let order: String
    public let refund: String?
}

extension Return {

    // MARK: - Retrieve

    public struct Retrieve: StripeAPI {

        public typealias Response = Return

        public var method: HTTPMethod { return .get }

        public var path: String { return "\(Return.path)/\(id)" }

        public let id: String
    }
}
