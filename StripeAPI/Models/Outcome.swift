//
//  Outcome.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct Outcome {
    let network_status: String
    let reason: String?
    let risk_level: String
    let seller_message: String
    let type: String

    init?(_ object: [AnyHashable: Any]) {

        guard let network_status: String = object["network_status"] as? String else {
            return nil
        }
        self.reason = object["network_status"] as? String
        guard let risk_level: String = object["risk_level"] as? String else {
            return nil
        }
        guard let seller_message: String = object["seller_message"] as? String else {
            return nil
        }
        guard let type: String = object["type"] as? String else {
            return nil
        }
        self.network_status = network_status
        self.risk_level = risk_level
        self.seller_message = seller_message
        self.type = type

    }
}
