//
//  BankAccount.swift
//  StripeAPI
//
//  Created by nori on 2017/10/18.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct BankAccount: StripeModel {

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

    public enum Status: String, Codable {
        case new
        case validated
        case verified
        case verificationFailed = "verification_failed"
        case errored
    }

    public let id: String
    public let object: String
    public let account: String
    public let accountHolderName: String
    public let accountHolderType: String
    public let bankName: String
    public let country: String
    public let currency: Currency
    public let defaultForCurrency: Bool
    public let fingerprint: String
    public let last4: String
    public let metadata: [String: String]
    public let routingNumber: String
    public let status: Status
}
