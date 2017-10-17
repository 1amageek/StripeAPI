//
//  Shipping.swift
//  StripeAPI
//
//  Created by nori on 2017/10/17.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct Shipping: Codable {

    public let address: Address
    public let name: String
    public let phone: String
}
