//
//  TestConfiguration_sample.swift
//  StripeAPITests
//
//  Created by nori on 2017/10/16.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

class TestConfiguration_sample {
    /// https://dashboard.stripe.com/account/apikeys
    static let publishableKey = "pk_test_xxxxxx"

    /// https://dashboard.stripe.com/account/apikeys
    static let secretKey = "sk_test_xxxxxxxx"

    /// https://github.com/stripe/example-ios-backend/tree/v11.0.0
    static let customerKeyURL = URL(string: "https://hoge.com")!
}
