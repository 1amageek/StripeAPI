//
//  SKU.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit

public struct SKU: StripeModel {

    public static var path: String { return "/skus"}

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case active
        case attributes
        case created
        case currency
        case image
        case inventory
        case livemode
        case metadata
        case packageDimensions = "package_dimensions"
        case price
        case product
        case updated
    }

    public let id: String
    public let object: String
    public let active: Bool
    public let attributes: [String: String]
    public let created: TimeInterval
    public let currency: String
    public let image: URL?
    public let inventory: Inventory
    public let livemode: Bool
    public let metadata: [String: String]
    public let packageDimensions: PackageDimensions?
    public let price: Int
    public let product: String
    public let updated: TimeInterval
}

extension SKU {

    // MARK: - Create

    public struct Create: StripeParametersAPI {

        public typealias Response = Customer

        public var method: HTTPMethod { return .post }

        public var path: String { return Customer.path }

        public var _parameters: Any?

        public init() {
            self._parameters = Parameters()
        }

        public init(parameters: Parameters) {
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

    // MARK: - Retrieve

    public struct Retrieve: StripeAPI {

        public typealias Response = Customer

        public var method: HTTPMethod { return .get }

        public var path: String { return "\(Customer.path)/\(id)" }

        public let id: String
    }

    // MARK: - Update

    public struct Update: StripeParametersAPI {

        public typealias Response = Customer

        public var method: HTTPMethod { return .post }

        public var path: String { return "\(Customer.path)/\(id)" }

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

        public var path: String { return "\(Customer.path)/\(id)" }

        public let id: String

        public struct Response: Codable {
            public let deleted: Bool
            public let id: String
        }
    }
}
