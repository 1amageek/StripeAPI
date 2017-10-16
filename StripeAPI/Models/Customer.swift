//
//  Customer.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct Customer: Decodable {

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
