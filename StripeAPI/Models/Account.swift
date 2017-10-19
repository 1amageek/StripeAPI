//
//  Account.swift
//  StripeAPI
//
//  Created by nori on 2017/10/18.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit
import Stripe

public struct Account: StripeModel, ListProtocol {

    public static var path: String { return "/accounts"}

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case businessLogo = "business_logo"
        case businessName = "business_name"
        case businessUrl = "business_url"
        case chargesEnabled = "charges_enabled"
        case country
        case debitNegativeBalances = "debit_negative_balances"
        case declineChargeOn = "decline_charge_on"
        case defaultCurrency = "default_currency"
        case detailsSubmitted = "details_submitted"
        case displayName = "display_name"
        case email
        case externalAccount = "external_account"
        case legalEntity = "legal_entity"
        case metadata
        case payoutSchedule = "payout_schedule"
        case payoutStatementDescriptor = "payout_statement_descriptor"
        case payoutsEnabled = "payouts_enabled"
        case productDescription = "product_description"
        case statementDescriptor = "statement_descriptor"
        case supportEmail = "support_email"
        case supportPhone = "support_phone"
        case timezone
        case tosAcceptance = "tos_acceptance"
        case type
        case verification
    }

    public struct DeclineChargeOn: Codable {

        private enum CodingKeys: String, CodingKey {
            case avsFailure = "avs_failure"
            case cvcFailure = "cvc_failure"
        }

        public let avsFailure: Bool
        public let cvcFailure: Bool
    }

    public struct LegalEntity: Codable {

        private enum CodingKeys: String, CodingKey {
            case additional_owners = "avs_failure"
            case address = "cvc_failure"
            case addressKana = "address_kana"
            case addressKanji = "address_kanji"
            case businessName = "business_name"
            case businessNameKana = "business_name_kana"
            case businessNameKanji = "business_name_kanji"
            case businessTaxIdProvided = "business_tax_id_provided"
            case businessVatIdProvided = "business_vat_id_provided"
            case dob
            case firstName = "first_name"
            case firstNameKana = "first_name_kana"
            case firstNameKanji = "first_name_kanji"
            case gender
            case lastName = "last_name"
            case lastNameKana = "last_name_kana"
            case lastNameKanji = "last_name_kanji"
            case maidenName = "maiden_name"
            case personalAddress = "personal_address"
            case personalAddressKana = "personal_address_kana"
            case personalAddressKanji = "personal_address_kanji"
            case personalIdNumberProvided = "personal_id_number_provided"
            case phoneNumber = "phone_number"
            case ssnLast4Provided = "ssn_last_4_provided"
            case taxIdRegistrar = "tax_id_registrar"
            case type
            case verification
        }

        public struct Dob: Codable {
            public let day: Int
            public let month: Int
            public let year: Int
        }

        public enum LegalEntityType: String, Codable {
            case individual
            case company
        }

        public struct Verification: Codable {

            private enum CodingKeys: String, CodingKey {
                case details
                case detailsCode = "details_code"
                case document
                case status
            }

            public enum Status: String, Codable {
                case unverified
                case pending
                case verified
            }

            public let details: String?
            public let detailsCode: String?
            public let document: String?
            public let status: Status
        }

        public let additional_owners: List<LegalEntity>
        public let address: Address
        public let addressKana: Address.Kana?
        public let addressKanji: Address.Kana?
        public let businessName: String?
        public let businessNameKana: String?
        public let businessNameKanji: String?
        public let businessTaxIdProvided: Bool?
        public let businessVatIdProvided: Bool?
        public let dob: Dob
        public let firstName: String?
        public let firstNameKana: String?
        public let firstNameKanji: String?
        public let gender: String?
        public let lastName: String?
        public let lastNameKana: String?
        public let lastNameKanji: String?
        public let maidenName: String?
        public let personalAddress: String?
        public let personalAddressKana: String?
        public let personalAddressKanji: String?
        public let personalIdNumberProvided: Bool?
        public let phoneNumber: String?
        public let ssnLast4Provided: Bool?
        public let taxIdRegistrar: String?
        public let type: LegalEntityType
        public let verification: Verification
    }

    public struct PayoutSchedule: Codable {

        private enum CodingKeys: String, CodingKey {
            case delayDays = "delay_days"
            case interval
            case monthlyAnchor = "monthly_anchor"
            case weeklyAnchor = "weekly_anchor"
        }

        public enum Interval: String, Codable {
            case manual
            case daily
            case weekly
            case monthly
        }

        public let delayDays: Int
        public let interval: Interval
        public let monthlyAnchor: Int
        public let weeklyAnchor: String
    }

    public struct TosAcceptance: Codable {

        private enum CodingKeys: String, CodingKey {
            case date
            case ip
            case userAgent = "user_agent"
        }

        public let date: TimeInterval
        public let ip: String
        public let userAgent: String?
    }

    public enum AccountType: String, Codable {
        case standard
        case express
        case custom
    }

    public struct Verification: Codable {

        private enum CodingKeys: String, CodingKey {
            case disabledReason = "disabled_reason"
            case dueBy = "due_by"
            case fieldsNeeded = "fields_needed"
        }

        public enum DisabledReason: String, Codable {
            case rejectedFraud = "rejected.fraud"
            case rejectedTermsOfService = "rejected.terms_of_service"
            case rejectedListed = "rejected.listed"
            case rejectedOther = "rejected.other"
            case fieldsNeeded = "fields_needed"
            case listed = "listed"
            case underReview = "under_review"
            case other = "other"
        }

        public let disabledReason: DisabledReason?
        public let dueBy: TimeInterval?
        public let fieldsNeeded: [String]
    }

    public let id: String
    public let object: String
    public let businessLogo: String?
    public let businessName: String?
    public let businessUrl: String?
    public let chargesEnabled: Bool?
    public let country: String?
    public let debitNegativeBalances: Bool
    public let declineChargeOn: DeclineChargeOn
    public let defaultCurrency: Currency
    public let detailsSubmitted: Bool
    public let displayName: String?
    public let email: String?
    public let externalAccount: List<BankAccount>
    public let legalEntity: LegalEntity
    public let metadata: [String: String]?
    public let payoutSchedule: PayoutSchedule
    public let payoutStatementDescriptor: String
    public let payoutsEnabled: Bool
    public let productDescription: String
    public let statementDescriptor: String
    public let supportEmail: String
    public let supportPhone: String
    public let timezone: String
    public let tosAcceptance: TosAcceptance
    public let type: AccountType
    public let verification: Verification
}

extension Account {

    // MARK: - Create

    public struct Create: StripeParametersAPI {

        public typealias Response = Account

        public var method: HTTPMethod { return .post }

        public var path: String { return Account.path }

        public var _parameters: Any?

        public init(type: AccountType, email: String?, country: String?) {
            self._parameters = Paramaters(type: type, email: email, country: country)
        }

        public init(parameters: Paramaters) {
            self._parameters = parameters
        }

        public struct Paramaters: Codable {

            private enum CodingKeys: String, CodingKey {
                case country
                case email
                case type
            }

            public init(type: AccountType, email: String?, country: String?) {
                self.type = type
                self.email = email
                self.country = country
            }

            public var country: String? = nil
            public var email: String? = nil
            public var type: AccountType
        }
    }

    // MARK: - Retrieve

    public struct Retrieve: StripeAPI {

        public typealias Response = Account

        public var method: HTTPMethod { return .get }

        public var path: String { return "/\(Account.path)/\(id)" }

        public let id: String
    }

    // MARK: - Update

    public struct Update: StripeParametersAPI {

        public typealias Response = Account

        public var method: HTTPMethod { return .post }

        public var path: String { return "/\(Account.path)/\(id)" }

        public let id: String

        public var _parameters: Any?

        public init(id: String, parameters: Parameters) {
            self.id = id
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case businessLogo = "business_logo"
                case businessName = "business_name"
                case businessPrimaryColor = "business_primary_color"
                case businessUrl = "business_url"
                case debitNegativeBalances = "debit_negative_balances"
                case declineChargeOn = "decline_charge_on"
                case defaultCurrency = "default_currency"
                case email
                case externalAccount = "external_account"
                case legalEntity = "legal_entity"
                case metadata
                case payoutSchedule = "payout_schedule"
                case payoutStatementDescriptor = "payout_statement_descriptor"
                case productDescription = "product_description"
                case statementDescriptor = "statement_descriptor"
                case supportEmail = "support_email"
                case supportPhone = "support_phone"
                case tosAcceptance = "tos_acceptance"
            }

            public let businessLogo: String? = nil
            public let businessName: String? = nil
            public let businessPrimaryColor: String? = nil
            public let businessUrl: String? = nil
            public let debitNegativeBalances: Bool? = nil
            public let declineChargeOn: DeclineChargeOn? = nil
            public let defaultCurrency: Currency? = nil
            public let email: String? = nil
            public let externalAccount: List<BankAccount>? = nil
            public let legalEntity: LegalEntity? = nil
            public let metadata: [String: String]? = nil
            public let payoutSchedule: PayoutSchedule? = nil
            public let payoutStatementDescriptor: String? = nil
            public let productDescription: String? = nil
            public let statementDescriptor: String? = nil
            public let supportEmail: String? = nil
            public let supportPhone: String? = nil
            public let tosAcceptance: TosAcceptance? = nil
        }
    }

    // MARK: - Delete

    public struct Delete: StripeAPI {

        public var method: HTTPMethod { return .delete }

        public var path: String { return "/\(Account.path)/\(id)" }

        public let id: String

        public struct Response: Codable {
            public let deleted: Bool
            public let id: String
        }
    }

    // MARK: - Reject

    public struct Reject: StripeParametersAPI {

        public typealias Response = Account

        public var method: HTTPMethod { return .post }

        public var path: String { return "/\(Account.path)/\(id)/reject" }

        public let id: String

        public var _parameters: Any?

        public init(id: String, reason: Reason) {
            self.id = id
            self._parameters = Parameters(reason: reason)
        }

        public init(id: String, parameters: Parameters) {
            self.id = id
            self._parameters = parameters
        }

        public enum Reason: String, Codable {
            case fraud
            case termsOfService = "terms_of_service"
            case other
        }

        public struct Parameters: Codable {
            public let  reason: Reason
        }
    }
}
