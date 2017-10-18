//
//  Subscription.swift
//  StripeAPI
//
//  Created by nori on 2017/10/17.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct Subscription: StripeModel, ListProtocol {

    public static var path: String { return "subscriptions" }

    let id: String
}
