//
//  Customer.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit
import Stripe

public struct Customer: Codable {

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case accountBalance = "account_balance"
        case created
        case currency
        case defaultSource = "default_source"
        case delinquent
        case discount
        case email
        case livemode
    }

    let id: String
    let object: String
    let accountBalance: Int
    let created: TimeInterval
    let currency: String?
    let defaultSource: String?
    let delinquent: Bool
//    let description: String?
    let discount: Discount?
    let email: String?
    let livemode: Bool
    //    let metadata: Any?

}

extension Customer {

    public struct Create: StripeAPI {

        public typealias Response = Customer

        public var method: HTTPMethod { return .post }

        public var path: String { return "/customers" }

        public var queryParameters: [String : Any]? {
            switch self {
            default: return nil
            }
        }

        public struct Parameters: Codable {
//            private enum CodingKeys: String, CodingKey {
//                case accountBalance
//                case businessVatID
//                case coupon
//                case defaultSource
//                case description
//                case email
////                case metadata
//                case shipping
//                case source
//            }

            let accountBalance: Int?
            let businessVatID: String?
//            let coupon: Coupon?
            let defaultSource: String?
            let description: String?
            let email: String?
//            let metadata: [AnyHashable: Any]?
//            let shipping: Shipping?
            let source: Source?
        }


    }

    public struct Retrieve: StripeAPI {
        public typealias Response = Customer

        public var method: HTTPMethod { return .post }

        public var path: String { return "/customers" }
    }


    public struct Parameters: ParamaterRequestable {
        let accountBalance: Int?
        let businessVatID: String?
        let coupon: String?
        let defaultSource: String?
        let description: String?
        let email: String?
        let metadata: [AnyHashable: Any]?
        let shipping: [AnyHashable: Any]?
        let source: [AnyHashable: Any]?
    }

    public enum Request: StripeAPI {

        case create(Parameters)
        case retrieve
        case delete

        public typealias Response = Customer

        public var method: HTTPMethod {
            switch self {
            case .create: return .post
            case .retrieve: return .get
            case .delete: return .delete
            }
        }

        public var path: String {
            return "/customers"
        }

        public var queryParameters: [String : Any]? {
            switch self {
            case .create(let parameters): return parameters.parameters as? [String : Any]
            default: return nil
            }
        }
    }
}



