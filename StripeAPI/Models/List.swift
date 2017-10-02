//
//  List.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct List<T: Decodable>: Decodable {
    let object: String
    let data: [T]
    let has_more: Bool
    let total_count: Int
    let url: String
}
