//
//  List.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit


public struct List<T: StripeModel>: Codable {

    public typealias Element = T

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

extension List {

    public struct Get: StripeAPI {

        public var method: HTTPMethod { return .get }

        public var path: String { return "\(Element.path)" }

        public typealias Response = List<Element>

        public let limit: Int = 30
    }

    public struct Next: StripeAPI {
        public var method: HTTPMethod { return .get }

        public var path: String { return Element.path }

        public typealias Response = List<Element>

        public let limit: Int = 30

        public let endingBefore: String
    }
}
