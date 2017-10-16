//
//  OrderItem.swift
//  StripeAPI
//
//  Created by nori on 2017/10/16.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct OrderItem: Decodable {

    let object: String
    let amount: Int
    let currency: String
    let description: String
    let parent: String
    let quantity: Int?
    let type: String

}
