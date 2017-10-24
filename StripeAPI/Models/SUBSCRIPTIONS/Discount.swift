//
//  Discount.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/16.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit

public struct Discount: StripeModel {

    public let object: String
    public let coupon: Coupon?
    public let customer: String?
    public let end: TimeInterval
    public let start: TimeInterval
    public let subscription: String?
}

extension Discount {

    // MARK: - Delete

    public struct Delete: StripeAPI {

        public var method: HTTPMethod { return .delete }

        public var path: String {
            if let id: String = self.customerID {
                return "\(Customer.path)/\(id)/discount"
            } else if let id: String = self.subscriptionID {
                return "\(Subscription.path)/\(id)/discount"
            } else {
                fatalError()
            }
        }

        public let customerID: String?

        public let subscriptionID: String?

        public init(customerID: String) {
            self.customerID = customerID
            self.subscriptionID = nil
        }

        public init(subscriptionID: String) {
            self.customerID = nil
            self.subscriptionID = subscriptionID
        }

        public struct Response: Codable {
            public let deleted: Bool
            public let id: String
        }
    }
}
