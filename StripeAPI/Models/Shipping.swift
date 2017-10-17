//
//  Shipping.swift
//  StripeAPI
//
//  Created by nori on 2017/10/17.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct Shipping: Codable {

    let address: Address
    let name: String
    let phone: String
}
