//
//  Source.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit

public struct Source: StripeModel {
    public static var path: String { return "/sources"}
    public let amount: Double?
    public let currency: Currency?
    public let flow: String?
}

extension Source {

    // MARK: - Create

    public struct Create: StripeParametersAPI {

        public typealias Response = Source

        public var method: HTTPMethod { return .post }

        public var path: String { return Source.path }

        public var _parameters: Any?

        public init(type: Parameters.SourceType) {
            self._parameters = Parameters(type: type)
        }

        public init(parameters: Parameters) {
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case type
                case amount
                case currency
                case flow
                case metadata
                case owner
                case redirect
                case statementDescriptor = "statement_descriptor"
                case token
                case usage
            }

            public var type: SourceType? = nil
            public var amount: Int? = nil
            public var currency: Currency? = nil
            public var flow: Flow? = nil
            public var metadata: [String: String]? = nil
            public var owner: Owner?
            public var redirect: Redirect? = nil
            public var statementDescriptor: String? = nil
            public var token: String? = nil
            public var usage: Usage? = nil

            public init(type: SourceType) {
                self.type = type
            }

            public enum SourceType: String, Codable {
                case card
                case bitcoin
                case ideal
                case alipay
                case ach
                // FIXME:
            }

            public enum Flow: String, Codable {
                case redirect
                case receiver
                case codeVerification = "code_verification"
                case none = "none"
            }

            public struct Owner: Codable {

                public var address: Address? = nil
                public var email: String? = nil
                public var name: String? = nil
                public var phone: String? = nil
            }

            public struct Redirect: Codable {

                private enum CodingKeys: String, CodingKey {
                    case returnUrl = "return_url"
                }

                public let returnUrl: String
            }

            public enum Usage: String, Codable {
                case reusable
                case singleUse = "single_use"
            }
        }
    }

    // MARK: - Retrieve

    public struct Retrieve: StripeAPI {

        public typealias Response = Source

        public var method: HTTPMethod { return .get }

        public var path: String { return "\(Source.path)/\(id)" }

        public let id: String
    }

    // MARK: - Update

    public struct Update: StripeParametersAPI {

        public typealias Response = Source

        public var method: HTTPMethod { return .post }

        public var path: String { return "\(Source.path)/\(id)" }

        public let id: String

        public var _parameters: Any?

        public init(id: String, parameters: Parameters) {
            self.id = id
            self._parameters = parameters
        }

        public struct Parameters: Codable {

            private enum CodingKeys: String, CodingKey {
                case metadata
                case owner
            }

            public var metadata: [String: String]? = nil
            public var owner: Owner?

            public struct Owner: Codable {

                public var address: Address? = nil
                public var email: String? = nil
                public var name: String? = nil
                public var phone: String? = nil
            }
        }
    }
}
