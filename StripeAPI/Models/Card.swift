//
//  Card.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct Card {

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
    let metadata: [AnyHashable: Any]
    let name: String?
    let tokenization_method: String?

    init?(_ object: [AnyHashable: Any]) {
        guard let id: String = object["id"] as? String else {
            return nil
        }
        guard let obj: String = object["object"] as? String else {
            return nil
        }
        self.address_city = object["address_city"] as? String
        self.address_country = object["address_country"] as? String
        self.address_line1 = object["address_line1"] as? String
        self.address_line1_check = object["address_line1_check"] as? String
        self.address_line2 = object["address_line2"] as? String
        self.address_state = object["address_state"] as? String
        self.address_zip = object["address_zip"] as? String
        self.address_zip_check = object["address_zip_check"] as? String
        guard let brand: String = object["brand"] as? String else {
            return nil
        }
        guard let country: String = object["country"] as? String else {
            return nil
        }
        guard let customer: String = object["customer"] as? String else {
            return nil
        }

        //TODO: nullで渡るので不要
        //            guard let cvc_check: String = object["cvc_check"] as? String else {
        //                return nil
        //            }

        self.dynamic_last4 = object["dynamic_last4"] as? String
        guard let exp_month: Int = object["exp_month"] as? Int else {
            return nil
        }
        guard let exp_year: Int = object["exp_year"] as? Int else {
            return nil
        }
        self.fingerprint = object["fingerprint"] as? String
        guard let funding: String = object["funding"] as? String else {
            return nil
        }
        guard let last4: String = object["last4"] as? String else {
            return nil
        }
        guard let metadata: [AnyHashable: Any] = object["metadata"] as? [AnyHashable: Any] else {
            return nil
        }
        self.name = object["name"] as? String
        self.tokenization_method = object["tokenization_method"] as? String

        self.id = id
        self.object = obj
        self.brand = brand
        self.country = country
        self.customer = customer
        self.cvc_check = nil //TODO: nullで返却されるので一旦nil
        self.exp_month = exp_month
        self.exp_year = exp_year
        self.funding = funding
        self.last4 = last4
        self.metadata = metadata

    }
}
