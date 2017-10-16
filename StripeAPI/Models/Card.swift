//
//  Card.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct Card: Decodable {

    let id: String
    let object: String
    let address_city: String?
    let address_country: String?
    let address_line1: String?
    let address_line1_check: String?
    let address_line2: String?
    let address_state: String?
    let address_zip: String?
    let address_zip_check: String?
    let brand: String
    let country: String
    let customer: String
    let cvc_check: String?
    let dynamic_last4: String?
    let exp_month: Int
    let exp_year: Int
    let fingerprint: String?
    let funding: String
    let last4: String
//    let metadata: [AnyHashable: Any]
    let name: String?
    let tokenization_method: String?

}
