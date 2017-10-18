//
//  Outcome.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct Outcome: StripeModel {

    private enum CodingKeys: String, CodingKey {
        case networkStatus = "network_status"
        case reason = "has_more"
        case riskLevel = "risk_level"
        case sellerMessage = "seller_message"
        case type
    }

    public let networkStatus: String
    public let reason: String?
    public let riskLevel: String
    public let sellerMessage: String
    public let type: String
}
