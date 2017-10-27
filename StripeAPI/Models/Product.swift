//
//  Product.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit

public struct Product: StripeModel, ListProtocol {

    public static var path: String { return "/products" }

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case active
        case attributes
        case caption
        case created
        case deactivateOn = "deactivate_on"
        case description
        case images
        case livemode
        case metadata
        case name
        case packageDimensions = "package_dimensions"
        case shippable
        case skus
        case updated
        case url
    }

    public let id: String
    public let object: String
    public let active: Bool
    public let attributes: [String]
    public let caption: String?
    public let created: TimeInterval
    public let deactivateOn: [String]
    public let description: String?
    public let images: [String]
    public let livemode: Bool
    public let metadata: [String: String]
    public let name: String
    public let packageDimensions: PackageDimensions?
    public let shippable: Bool
    public let skus: List<SKU>
    public let updated: TimeInterval
    public let url: String?
}

extension Product {

    // MARK: - Create

    public struct Create: StripeParametersAPI {

        public typealias Response = Product

        public var method: HTTPMethod { return .post }

        public var path: String { return Product.path }

        public var _parameters: Any?

        public init(name: String) {
            self._parameters = Parameters(name: name)
        }

        public init(parameters: Parameters) {
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case id
                case name
                case active
                case attributes
                case caption
                case deactivateOn = "deactivate_on"
                case description
                case images
                case metadata
                case packageDimensions = "package_dimensions"
                case shippable
                case url
            }

            public init(name: String) {
                self.name = name
            }

            public var id: String? = nil
            public var name: String
            public var active: Bool? = nil
            public var attributes: [String: String]? = nil
            public var caption: String? = nil
            public var deactivateOn: [String]? = nil
            public var description: String? = nil
            public var images: String? = nil
            public var metadata: [String: String]? = nil
            public var packageDimensions: PackageDimensions? = nil
            public var shippable: Bool? = nil
            public var url: String? = nil
        }
    }

    // MARK: - Retrieve

    public struct Retrieve: StripeAPI {

        public typealias Response = Product

        public var method: HTTPMethod { return .get }

        public var path: String { return "\(Product.path)/\(id)" }

        public let id: String
    }

    // MARK: - Update

    public struct Update: StripeParametersAPI {

        public typealias Response = Product

        public var method: HTTPMethod { return .post }

        public var path: String { return "\(Product.path)/\(id)" }

        public let id: String

        public var _parameters: Any?

        public init(id: String, parameters: Parameters) {
            self.id = id
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case name
                case active
                case attributes
                case caption
                case deactivateOn = "deactivate_on"
                case description
                case images
                case metadata
                case packageDimensions = "package_dimensions"
                case shippable
                case url
            }

            public var name: String? = nil
            public var active: Bool? = nil
            public var attributes: [String: String]? = nil
            public var caption: String? = nil
            public var deactivateOn: [String]? = nil
            public var description: String? = nil
            public var images: String? = nil
            public var metadata: [String: String]? = nil
            public var packageDimensions: PackageDimensions? = nil
            public var shippable: Bool? = nil
            public var url: String? = nil
        }
    }

    // MARK: - Delete

    public struct Delete: StripeAPI {

        public var method: HTTPMethod { return .delete }

        public var path: String { return "\(Product.path)/\(id)" }

        public let id: String

        public struct Response: Codable {
            public let deleted: Bool
            public let id: String
        }
    }

    // MARK: - List

    public struct All: StripeParametersAPI {

        public typealias Response = List<Product>

        public var method: HTTPMethod { return .get }

        public var path: String { return "\(Product.path)" }

        public var _parameters: Any?

        public init() {
            self._parameters = Parameters()
        }

        public init(parameters: Parameters) {
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case active
                case endingBefore = "ending_before"
                case ids
                case limit
                case shippable
                case startingAfter = "starting_after"
                case url
            }

            public var active: Bool? = nil
            public var endingBefore: String? = nil
            public var ids: [String]? = nil
            public var limit: Int? = nil
            public var shippable: Bool? = nil
            public var startingAfter: String? = nil
            public var url: String? = nil
        }
    }
}
