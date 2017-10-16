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

public struct Customer: Decodable {

    private enum CodingKeys: String, CodingKey {
        case id
        case object
        case accountBalance = "account_balance"
        case created
        case currency
        case defaultSource = "default_source"
        case delinquent
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
    //    let discount: String?
    let email: String?
    let livemode: Bool
    //    let metadata: Any?

}

extension Customer {

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

//extension Customer {
//    public struct Request: StripeAPI {
//
//
//
//        public typealias Response = Customer.Response
//
//        var description: String?
//
//        var source: String?
//
//        var email: String?
//
//        public var headerFields: [String : String] {
//            return ["authorization": "Basic \(encodedKey)"]
//        }
//
//        public var method: HTTPMethod {
//            return .post
//        }
//
//        public var path: String {
//            return "/customers"
//        }
//
//        public var queryParameters: [String : Any]? {
//
//            var parameters: [String: Any] = [:]
//
//            if let description: String = description {
//                parameters["description"] = description
//            }
//
//            if let source: String = source {
//                parameters["source"] = source
//            }
//
//            if let email: String = email {
//                parameters["email"] = email
//            }
//
//            return parameters
//        }
//    }
//
//    public struct Response: Decodable {
//
//    }
//}





extension Customer: Creatable {



//    public struct Request: StripeAPI {
//        public typealias Response = Customer
//
//        let amount: Int
//
//        let currency: String
//
//        let customer: String
//
//        var description: String?
//
//        public var headerFields: [String : String] {
//            return ["authorization": "Basic \(encodedKey)"]
//        }
//
//        public var method: HTTPMethod {
//            return .post
//        }
//
//        public var path: String {
//            return "/charges"
//        }
//
//        public var parameters: Any? {
//
//            var parameters: [String: Any] = [
//                "amount": self.amount,
//                "currency": self.currency,
//                "customer": self.customer
//            ]
//
//            if let description: String = description {
//                parameters["description"] = description
//            }
//
//            return parameters
//        }
//    }
}

