//
//  Source.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct Source: Decodable {
    let amount: Double?
    let currency: String?
    let flow: String?
}
