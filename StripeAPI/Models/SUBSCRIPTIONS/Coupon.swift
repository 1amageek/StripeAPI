//
//  Coupon.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/16.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit

public struct Coupon: StripeModel, ListProtocol {

    public static var path: String { return "/coupons" }

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case amountOff = "amount_off"
        case created
        case currency
        case duration
        case durationInMonths = "duration_in_months"
        case livemode
        case maxRedemptions = "max_redemptions"
        case percentOff = "percent_off"
        case redeemBy = "redeem_by"
        case timesRedeemed = "times_redeemed"
        case valid
    }

    public enum Duration: String, Codable {
        case forever
        case once
        case repeating
    }

    public let id: String
    public let object: String
    public let amountOff: Int
    public let created: TimeInterval
    public let currency: Currency
    public let duration: Duration
    public let durationInMonths: Int?
    public let livemode: Bool
    public let maxRedemptions: Int?
    public let percentOff: Int?
    public let redeemBy: TimeInterval
    public let timesRedeemed: Int
    public let valid: Bool
}

extension Coupon {

    // MARK: - Create

    public struct Create: StripeParametersAPI {

        public typealias Response = Coupon

        public var method: HTTPMethod { return .post }

        public var path: String { return Coupon.path }

        public var _parameters: Any?

        public init(duration: Duration) {
            self._parameters = Parameters(duration: duration)
        }

        public init(durationInMonths: Int) {
            self._parameters = Parameters(durationInMonths: durationInMonths)
        }

        public init(parameters: Parameters) {
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case id
                case duration
                case amountOff = "amount_off"
                case currency
                case durationInMonths = "duration_in_months"
                case maxRedemptions = "max_redemptions"
                case metadata
                case percentOff = "percent_off"
                case redeemBy = "redeem_by"
            }

            public var id: String? = nil
            public let duration: Duration
            public var amountOff: Int? = nil
            public var currency: Currency? = nil
            public var durationInMonths: Int? = nil
            public var maxRedemptions: Int? = nil
            public var metadata: [String: String]? = nil
            public var percentOff: Int? = nil // 1 - 100
            public var redeemBy: TimeInterval? = nil

            public init(duration: Duration) {
                self.duration = duration
            }

            public init(durationInMonths: Int) {
                self.duration = .repeating
                self.durationInMonths = durationInMonths
            }
        }
    }

    // MARK: - Retrieve

    public struct Retrieve: StripeAPI {

        public typealias Response = Coupon

        public var method: HTTPMethod { return .get }

        public var path: String { return "\(Coupon.path)/\(id)" }

        public let id: String

        public init(id: String) {
            self.id = id
        }
    }

    // MARK: - Update

    public struct Update: StripeParametersAPI {

        public typealias Response = Coupon

        public var method: HTTPMethod { return .post }

        public var path: String { return "\(Coupon.path)/\(id)" }

        public let id: String

        public var _parameters: Any?

        public init(id: String, metadata: [String: String]) {
            self.id = id
            self._parameters = Parameters(metadata: metadata)
        }

        public struct Parameters: Codable {
            public let metadata: [String: String]
        }
    }

    // MARK: - Delete

    public struct Delete: StripeAPI {

        public var method: HTTPMethod { return .delete }

        public var path: String { return "\(Coupon.path)/\(id)" }

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
