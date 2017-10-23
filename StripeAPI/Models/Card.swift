//
//  Card.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit

public struct Card: StripeModel {

    public static var path: String { return "/sources"}

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case addressCity = "address_city"
        case addressCountry = "address_country"
        case addressLine1 = "address_line1"
        case addressLine1Check = "address_line1_check"
        case addressLine2 = "address_line2"
        case addressState = "address_state"
        case addressZip = "address_zip"
        case addressZipCheck = "address_zip_check"
        case brand
        case country
        case currency
        case customer
        case cvcCheck = "cvc_check"
        case defaultForCurrency = "default_for_currency"
        case dynamicLast4 = "dynamic_last4"
        case expMonth = "exp_month"
        case expYear = "exp_year"
        case fingerprint
        case funding
        case last4
        case metadata
        case name
        case tokenizationMethod = "tokenization_method"
    }

    public let id: String
    public let object: String
    public let addressCity: String?
    public let addressCountry: String?
    public let addressLine1: String?
    public let addressLine1Check: String?
    public let addressLine2: String?
    public let addressState: String?
    public let addressZip: String?
    public let addressZipCheck: String?
    public let brand: String?
    public let country: String?
    public let currency: Currency?
    public let customer: String
    public let cvcCheck: String?
    public let defaultForCurrency: Bool?
    public let dynamicLast4: String?
    public let expMonth: Int
    public let expYear: Int
    public let fingerprint: String?
    public let funding: String?
    public let last4: String?
    public let metadata: [String: String]?
    public let name: String?
    public let tokenizationMethod: String?
}

extension Card {

    // MARK: - Create

    public struct Create: StripeParametersAPI {

        public typealias Response = Card

        public var method: HTTPMethod { return .post }

        public var path: String { return "\(Customer.path)/\(customerID)\(Card.path)" }

        public let customerID: String

        public var _parameters: Any?

        public init(customerID: String, expMonth: String, expYear: String, number: String, currency: Currency, cvc: String) {
            self.customerID = customerID
            self._parameters = Parameters(expMonth: expMonth, expYear: expYear, number: number, currency: currency, cvc: cvc)
        }

        public init(customerID: String, parameters: Parameters) {
            self.customerID = customerID
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            public let source: Source

            public var metadata: [String: String]? = nil

            public init(expMonth: String, expYear: String, number: String, currency: Currency, cvc: String) {
                self.source = Source(expMonth: expMonth, expYear: expYear, number: number, currency: currency, cvc: cvc)
            }

            public init(source: Source) {
                self.source = source
            }

            public struct Source: Codable {

                private enum CodingKeys: String, CodingKey {
                    case object
                    case expMonth = "exp_month"
                    case expYear = "exp_year"
                    case number
                    case addressCity = "address_city"
                    case addressCountry = "address_country"
                    case addressLine1 = "address_line1"
                    case addressLine2 = "address_line2"
                    case addressState = "address_state"
                    case addressZip = "address_zip"
                    case currency
                    case cvc
                    case defaultForCurrency = "default_for_currency"
                    case metadata
                    case name
                }

                public let object: String = "card"
                public var expMonth: String
                public var expYear: String
                public var number: String
                public var addressCity: String? = nil
                public var addressCountry: String? = nil
                public var addressLine1: String? = nil
                public var addressLine2: String? = nil
                public var addressState: String? = nil
                public var addressZip: String? = nil
                public var currency: Currency
                public var cvc: String
                public var defaultForCurrency: Bool? = nil
                public var metadata: [String: String]? = nil
                public var name: String? = nil

                public init(expMonth: String, expYear: String, number: String, currency: Currency, cvc: String) {
                    self.expMonth = expMonth
                    self.expYear = expYear
                    self.number = number
                    self.currency = currency
                    self.cvc = cvc
                }
            }
        }
    }

    // MARK: - Retrieve

    public struct Retrieve: StripeAPI {

        public typealias Response = Card

        public var method: HTTPMethod { return .get }

        public var path: String { return "\(Customer.path)/\(customerID)\(Card.path)/\(id)" }

        public let customerID: String

        public let id: String
    }

    // MARK: - Update

    public struct Update: StripeParametersAPI {

        public typealias Response = Card

        public var method: HTTPMethod { return .post }

        public var path: String { return "\(Customer.path)/\(customerID)\(Card.path)/\(id)" }

        public let customerID: String

        public let id: String

        public var _parameters: Any?

        public init(customerID: String, id: String, parameters: Parameters) {
            self.customerID = customerID
            self.id = id
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case addressCity = "address_city"
                case addressCountry = "address_country"
                case addressLine1 = "address_line1"
                case addressLine2 = "address_line2"
                case addressState = "address_state"
                case addressZip = "address_zip"
                case expMonth = "exp_month"
                case expYear = "exp_year"
                case metadata
                case name
            }

            public var addressCity: String? = nil
            public var addressCountry: String? = nil
            public var addressLine1: String? = nil
            public var addressLine2: String? = nil
            public var addressState: String? = nil
            public var addressZip: String? = nil
            public var expMonth: String? = nil
            public var expYear: String? = nil
            public var metadata: [String: String]? = nil
            public var name: String? = nil
        }
    }

    // MARK: - Delete

    public struct Delete: StripeAPI {

        public var method: HTTPMethod { return .delete }

        public var path: String { return "\(Customer.path)/\(customerID)\(Card.path)/\(id)" }

        public let customerID: String

        public let id: String

        public struct Response: Codable {
            public let deleted: Bool
            public let id: String
        }
    }
}
