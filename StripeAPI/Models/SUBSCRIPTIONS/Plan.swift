//
//  Plan.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/25.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit

public struct Plan: StripeModel, ListProtocol {

    public static var path: String { return "/plans"}

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case amount
        case created
        case currency
        case interval
        case intervalCount = "interval_count"
        case livemode
        case metadata
        case name
        case statementDescriptor = "statement_descriptor"
        case trialPeriodDays = "trial_period_days"
    }

    public let id: String
    public let object: String
    public let amount: Double
    public let created: TimeInterval
    public let currency: Currency
    public let interval: Interval
    public let intervalCount: Int
    public let livemode: Bool
    public let metadata: [String: String]?
    public let name: String
    public let statementDescriptor: String?
    public let trialPeriodDays: Int?

    public enum Interval: String, Codable {
        case day
        case week
        case month
        case year
    }
}

extension Plan {

    // MARK: - Create

    public struct Create: StripeParametersAPI {

        public typealias Response = Plan

        public var method: HTTPMethod { return .post }

        public var path: String { return Plan.path }

        public var _parameters: Any?

        public init(id: String, amount: Double, currency: Currency, interval: Interval, name: String) {
            self._parameters = Parameters(id: id, amount: amount, currency: currency, interval: interval, name: name)
        }

        public init(parameters: Parameters) {
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case id
                case amount
                case currency
                case interval
                case name
                case intervalCount = "interval_count"
                case metadata
                case statementDescriptor = "statement_descriptor"
            }

            public let id: String
            public let amount: Double
            public let currency: Currency
            public let interval: Interval
            public let name: String
            public var intervalCount: Int = 1
            public var metadata: [String: String]? = nil
            public var statementDescriptor: String? = nil

            public init(id: String, amount: Double, currency: Currency, interval: Interval, name: String) {
                self.id = id
                self.amount = amount
                self.currency = currency
                self.interval = interval
                self.name = name
            }
        }
    }

    // MARK: - Retrieve

    public struct Retrieve: StripeAPI {

        public typealias Response = Plan

        public var method: HTTPMethod { return .get }

        public var path: String { return "\(Plan.path)/\(id)" }

        public let id: String

        public init(id: String) {
            self.id = id
        }
    }

    // MARK: - Update

    public struct Update: StripeParametersAPI {

        public typealias Response = Plan

        public var method: HTTPMethod { return .post }

        public var path: String { return "\(Plan.path)/\(id)" }

        public let id: String

        public var _parameters: Any?

        public init(id: String, parameters: Parameters) {
            self.id = id
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case metadata
                case name
                case statementDescriptor = "statement_descriptor"
            }

            public var metadata: [String: String]? = nil
            public let name: String? = nil
            public var statementDescriptor: String? = nil
        }
    }

    // MARK: - Delete

    public struct Delete: StripeAPI {

        public var method: HTTPMethod { return .delete }

        public var path: String { return "\(Plan.path)/\(id)" }

        public let id: String

        public init(id: String) {
            self.id = id
        }

        public struct Response: Codable {
            public let deleted: Bool
            public let id: String
        }
    }
}
