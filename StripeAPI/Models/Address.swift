//
//  Address.swift
//  StripeAPI
//
//  Created by nori on 2017/10/17.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct Address: Codable {

    private enum CodingKeys: String, CodingKey {
        case line1
        case city
        case country
        case line2
        case postalCode = "postal_code"
        case state
    }

    let line1: String
    let city: String?
    let country: String?
    let line2: String?
    let postalCode: String?
    let state: String?
}
