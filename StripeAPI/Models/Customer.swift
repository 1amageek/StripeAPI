//
//  Customer.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct Customer: Decodable {
    
    let id: String
    let object: String
    let account_balance: Int
    let business_vat_id: String?
    let created: TimeInterval
    let currency: String?
    let default_source: String
    let delinquent: Bool
    let description: String
    let email: String?
    let livemode: Bool
//    let metadata: [AnyHashable: Any]
    let sources: List<Source>
    
//    init?(_ object: [AnyHashable: Any]) {
//        guard let id: String = object["id"] as? String else {
//            return nil
//        }
//        guard let obj: String = object["object"] as? String else {
//            return nil
//        }
//        guard let account_balance: Int = object["account_balance"] as? Int else {
//            return nil
//        }
//        self.business_vat_id = object["business_vat_id"] as? String
//        guard let created: TimeInterval = object["created"] as? TimeInterval else {
//            return nil
//        }
//        self.currency = object["currency"] as? String
//        guard let default_source: String = object["default_source"] as? String else {
//            return nil
//        }
//        guard let delinquent: Bool = object["delinquent"] as? Bool else {
//            return nil
//        }
//        guard let description: String = object["description"] as? String else {
//            return nil
//        }
//        self.email = object["email"] as? String
//        guard let livemode: Bool = object["livemode"] as? Bool else {
//            return nil
//        }
//        guard let metadata: [AnyHashable: Any] = object["metadata"] as? [AnyHashable: Any] else {
//            return nil
//        }
//        guard let sources: [AnyHashable: Any] = object["sources"] as? [AnyHashable: Any] else {
//            return nil
//        }
//
//        self.id = id
//        self.object = obj
//        self.account_balance = account_balance
//        self.created = created
//        self.default_source = default_source
//        self.delinquent = delinquent
//        self.description = description
//        self.livemode = livemode
//        self.metadata = metadata
//        self.sources = List(sources)!
//    }
}
