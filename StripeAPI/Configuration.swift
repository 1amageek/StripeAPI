//
//  Configuration.swift
//  StripeAPI
//
//  Created by nori on 2017/10/17.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public class Configuration {

    public static var shared: Configuration!

    public var apiKey: String

    public init(apiKey: String) {
        self.apiKey = apiKey
        Configuration.shared = self
    }
}
