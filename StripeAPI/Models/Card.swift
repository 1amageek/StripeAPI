//
//  Card.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct Card: Codable {

    public let id: String
    public let object: String
    public let address_city: String?
    public let address_country: String?
    public let address_line1: String?
    public let address_line1_check: String?
    public let address_line2: String?
    public let address_state: String?
    public let address_zip: String?
    public let address_zip_check: String?
    public let brand: String
    public let country: String
    public let customer: String
    public let cvc_check: String?
    public let dynamic_last4: String?
    public let exp_month: Int
    public let exp_year: Int
    public let fingerprint: String?
    public let funding: String
    public let last4: String
    public let metadata: [String: String]
    public let name: String?
    public let tokenization_method: String?

}
