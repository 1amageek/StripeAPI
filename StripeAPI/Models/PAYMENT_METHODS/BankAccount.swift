//
//  BankAccount.swift
//  StripeAPI
//
//  Created by nori on 2017/10/18.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit

public struct BankAccount: StripeModel {

    public static var path: String { return "/sources"}

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case account
        case accountHolderName = "account_holder_name"
        case accountHolderType = "account_holder_type"
        case bankName = "bank_name"
        case country = "country"
        case currency = "currency"
        case defaultForCurrency = "default_for_currency"
        case fingerprint = "fingerprint"
        case last4 = "last4"
        case metadata = "metadata"
        case routingNumber = "routing_number"
        case status = "status"
    }

    public let id: String
    public let object: String
    public let account: String?
    public let accountHolderName: String
    public let accountHolderType: AccountHolderType
    public let bankName: String
    public let country: String
    public let currency: Currency
    public let defaultForCurrency: Bool?
    public let fingerprint: String
    public let last4: String
    public let metadata: [String: String]
    public let routingNumber: String?
    public let status: Status

    public enum AccountHolderType: String, Codable {
        case individual
        case company
    }

    public enum Status: String, Codable {
        case new
        case validated
        case verified
        case verificationFailed = "verification_failed"
        case errored
    }
}

extension BankAccount {

    // MARK: - Create

    public struct Create: StripeParametersAPI {

        public typealias Response = BankAccount

        public var method: HTTPMethod { return .post }

        public var path: String { return "\(Customer.path)/\(customerID)\(BankAccount.path)" }

        public let customerID: String

        public var _parameters: Any?

        public init(customerID: String, accountNumber: String, country: String, currency: Currency) {
            self.customerID = customerID
            self._parameters = Parameters(accountNumber: accountNumber, country: country, currency: currency)
        }

        public init(customerID: String, parameters: Parameters) {
            self.customerID = customerID
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            public var source: Source

            public var metadata: [String: String]? = nil

            public init(accountNumber: String, country: String, currency: Currency) {
                self.source = Source(accountNumber: accountNumber, country: country, currency: currency)
            }

            public init(source: Source) {
                self.source = source
            }

            public struct Source: Codable {

                private enum CodingKeys: String, CodingKey {
                    case object
                    case accountNumber = "account_number"
                    case country
                    case currency
                    case accountHolderName = "account_holder_name"
                    case accountHolderType = "account_holder_type"
                    case routingNumber = "routing_number"
                }

                public let object: String = "bank_account"
                public let accountNumber: String
                public let country: String
                public let currency: Currency
                public var accountHolderName: String? = nil
                public var accountHolderType: AccountHolderType? = nil
                public var routingNumber: String? = nil

                public init(accountNumber: String, country: String, currency: Currency) {
                    self.accountNumber = accountNumber
                    self.country = country
                    self.currency = currency
                }
            }
        }
    }

    // MARK: - Retrieve

    public struct Retrieve: StripeAPI {

        public typealias Response = Card

        public var method: HTTPMethod { return .get }

        public var path: String { return "\(Customer.path)/\(customerID)\(BankAccount.path)/\(id)" }

        public let customerID: String

        public let id: String
    }

    // MARK: - Update

    public struct Update: StripeParametersAPI {

        public typealias Response = BankAccount

        public var method: HTTPMethod { return .post }

        public var path: String { return "\(Customer.path)/\(customerID)\(BankAccount.path)/\(id)" }

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
                case accountHolderName = "account_holder_name"
                case accountHolderType = "account_holder_type"
                case metadata
            }

            public var accountHolderName: String? = nil
            public var accountHolderType: AccountHolderType? = nil
            public var metadata: [String: String]? = nil
        }
    }

    // MARK: - Verify

    public struct Verify: StripeParametersAPI {

        public typealias Response = BankAccount

        public var method: HTTPMethod { return .post }

        public var path: String { return "\(Customer.path)/\(customerID)\(BankAccount.path)/\(id)/verify" }

        public let customerID: String

        public let id: String

        public var _parameters: Any?

        public init(customerID: String, id: String, parameters: Parameters) {
            self.customerID = customerID
            self.id = id
            self._parameters = parameters
        }

        public struct Parameters: Codable {
            public var amounts: [Double]? = nil
        }
    }

    // MARK: - Delete

    public struct Delete: StripeAPI {

        public var method: HTTPMethod { return .delete }

        public var path: String { return "\(Customer.path)/\(customerID)\(BankAccount.path)/\(id)" }

        public let customerID: String

        public let id: String

        public struct Response: Codable {
            public let deleted: Bool
            public let id: String
        }
    }
}
