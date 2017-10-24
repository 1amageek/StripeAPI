//
//  Balance.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/24.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit

public struct Balance: StripeModel, ListProtocol {

    public static var path: String { return "/balance"}

    private enum CodingKeys: String, CodingKey {
        case object
        case available
        case connectReserved = "connect_reserved"
        case livemode
        case pending
    }

    public let object: String
    public let available: [Transaction]
    public let connectReserved: [ConnectReserved]
    public let livemode: Bool
    public let pending: [Transaction]

    public struct Transaction: Codable {
        private enum CodingKeys: String, CodingKey {
            case currency
            case amount
            case sourceTypes = "source_types"
        }

        public let currency: Currency
        public let amount: Double
        public let sourceTypes: [String: Double]
    }

    public struct ConnectReserved: Codable {
        public let currency: Currency
        public let amount: Double
    }
}

extension Balance {

    // MARK: - Retrieve

    public struct Retrieve: StripeAPI {

        public typealias Response = Balance

        public var method: HTTPMethod { return .get }

        public var path: String { return Balance.path }
    }
}

public struct BalanceTransaction: StripeModel {

    public static var path: String { return "/balance"}

    private enum CodingKeys: String, CodingKey {

        case id
        case object
        case amount
        case availableOn = "available_on"
        case created
        case currency
        case description
        case fee
        case feeDetails = "fee_details"
        case net
        case source
        case status
        case type
    }

    public let id: String
    public let object: String
    public let amount: Double
    public let availableOn: TimeInterval
    public let created: TimeInterval
    public let currency: Currency
    public let description: String
    public let fee: Int
    public let feeDetails: [FeeDetail] = []
    public let net: Int
    public let source: String?
    public let status: Status
    public let type: BalanceTransactionType

    // MARK: -

    public enum Status: String, Codable {
        case available
        case pending
    }

    public enum BalanceTransactionType: String, Codable {
        case adjustment
        case applicationFee = "application_fee"
        case applicationFeeRefund = "application_fee_refund"
        case charge
        case payment
        case paymentFailureRefund = "payment_failure_refund"
        case paymentRefund = "payment_refund"
        case refund
        case transfer
        case transferRefund = "transfer_refund"
        case payout
        case payoutCancel = "payout_cancel"
        case payoutFailure = "payout_failure"
        case validation
        case stripeFee = "stripe_fee"
    }

    public struct FeeDetail: Codable {

        private enum CodingKeys: String, CodingKey {
            case amount
            case application
            case currency
            case description
            case type
        }

        public enum FeeDetailType: String, Codable {
            case applicationFee = "application_fee"
            case stripeFee = "stripe_fee"
            case tax
        }

        public let amount: Double
        public let application: String?
        public let currency: Currency
        public let description: String?
        public let type: FeeDetailType
    }

    public struct ConnectReserved: Codable {
        public let currency: Currency
        public let amount: Double
    }
}

extension BalanceTransaction {

    // MARK: - Retrieve

    public struct Retrieve: StripeAPI {

        public typealias Response = Balance

        public var method: HTTPMethod { return .get }

        public var path: String { return "\(Balance.path)/history/\(id)" }

        public let id: String
    }
}
