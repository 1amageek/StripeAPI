//
//  List.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public struct List<T: Codable>: Codable {

    private enum CodingKeys: String, CodingKey {
        case object
        case hasMore = "has_more"
        case totalCount = "total_count"
        case url
        case data
    }

    public let object: String
    public let data: [T]
    public let hasMore: Bool
    public let totalCount: Int
    public let url: String
}
