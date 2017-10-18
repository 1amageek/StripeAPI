//
//  ShippingMethod.swift
//  StripeAPI
//
//  Created by nori on 2017/10/18.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct ShippingMethod: StripeModel {

    private enum CodingKeys: String, CodingKey {
        case id
        case amount
        case currency
        case deliveryEstimate = "delivery_estimate"
        case description
    }

    public struct DeliveryEstimate: StripeModel {

        public enum EstimateType: String, StripeModel {
            case range
            case exact
        }

        public let date: String
        public let earliest: String
        public let latest: String
        public let type: EstimateType
    }

    public let id: String
    public let amount: Int
    public let currency: Currency
    public let deliveryEstimate: DeliveryEstimate
    public let description: String
}
