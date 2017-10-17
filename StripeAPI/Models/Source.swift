//
//  Source.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct Source: StripeModel {
    public static var path: String { return "/sources"}
    public let amount: Double?
    public let currency: Currency?
    public let flow: String?
}
