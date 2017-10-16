//
//  Outcome.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct Outcome: Decodable {

    private enum CodingKeys: String, CodingKey {
        case networkStatus = "network_status"
        case reason = "has_more"
        case riskLevel = "risk_level"
        case sellerMessage = "seller_message"
        case type
    }

    let networkStatus: String
    let reason: String?
    let riskLevel: String
    let sellerMessage: String
    let type: String
}
