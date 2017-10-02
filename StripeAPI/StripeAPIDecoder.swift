//
//  StripeAPIDecoder.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

open class StripeAPIDecoder: JSONDecoder {
    open override func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
        return try super.decode(type, from: data)
    }
}
