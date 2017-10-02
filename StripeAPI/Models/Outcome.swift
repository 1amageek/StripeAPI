//
//  Outcome.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct Outcome: Decodable {
    let network_status: String
    let reason: String?
    let risk_level: String
    let seller_message: String
    let type: String
}
