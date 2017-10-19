//
//  SKU.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit

public struct SKU: StripeModel, ListProtocol {

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

    // MARK: -

    public struct Inventory: Codable {

        public enum InventoryType: String, Codable {
            case finite
            case bucket
            case infinite
        }

        public enum BucketValue: String, Codable {
            case limited
            case outOfStock = "out_of_stock"
            case inStock = "in_stock"
        }

        public let quantity: Int?
        public let type: InventoryType
        public let value: BucketValue?
    }

    public struct PackageDimensions: Codable {

        public let height: Float
        public let length: Float
        public let weight: Float
        public let width: Float
    }
}

extension SKU {

    // MARK: - Create

    public struct Create: StripeParametersAPI {

        public typealias Response = SKU

        public var method: HTTPMethod { return .post }

        public var path: String { return SKU.path }

        public var _parameters: Any?

        public init(currency: Currency, inventory: Inventory, price: Double, product: Product) {
            self._parameters = Parameters(currency: currency, inventory: inventory, price: price, product: product)
        }

        public init(parameters: Parameters) {
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case id
                case currency
                case inventory
                case price
                case product
                case active
                case attributes
                case image
                case metadata
                case packageDimensions = "package_dimensions"
            }

            public init(currency: Currency, inventory: Inventory, price: Double, product: Product) {
                self.currency = currency
                self.inventory = inventory
                self.price = price
                self.product = product
            }

            public var id: String? = nil
            public var currency: Currency
            public var inventory: Inventory
            public var price: Double
            public var product: Product
            public var active: Bool? = nil
            public var attributes: [String: String]? = nil
            public var image: String? = nil
            public var metadata: [String: String]? = nil
            public var packageDimensions: PackageDimensions? = nil
        }
    }

    // MARK: - Retrieve

    public struct Retrieve: StripeAPI {

        public typealias Response = Customer

        public var method: HTTPMethod { return .get }

        public var path: String { return "\(SKU.path)/\(id)" }

        public let id: String
    }

    // MARK: - Update

    public struct Update: StripeParametersAPI {

        public typealias Response = SKU

        public var method: HTTPMethod { return .post }

        public var path: String { return "\(SKU.path)/\(id)" }

        public let id: String

        public var _parameters: Any?

        public init(id: String, parameters: Parameters) {
            self.id = id
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case active
                case attributes
                case currency
                case image
                case inventory
                case metadata
                case packageDimensions = "package_dimensions"
                case price
                case product
            }

            public init(currency: Currency, inventory: Inventory, price: Double, product: Product) {
                self.currency = currency
                self.inventory = inventory
                self.price = price
                self.product = product
            }

            public var active: Bool? = nil
            public var attributes: [String: String]? = nil
            public var currency: Currency? = nil
            public var image: String? = nil
            public var inventory: Inventory? = nil
            public var metadata: [String: String]? = nil
            public var packageDimensions: PackageDimensions? = nil
            public var price: Double? = nil
            public var product: Product? = nil
        }
    }

    // MARK: - Delete

    public struct Delete: StripeAPI {

        public var method: HTTPMethod { return .delete }

        public var path: String { return "\(SKU.path)/\(id)" }

        public let id: String

        public struct Response: Codable {
            public let deleted: Bool
            public let id: String
        }
    }
}
