//
//  PackageDimensions.swift
//  StripeAPI
//
//  Created by nori on 2017/10/16.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct PackageDimensions: StripeModel {
    
    public let height: Float
    public let length: Float
    public let weight: Float
    public let width: Float
}
