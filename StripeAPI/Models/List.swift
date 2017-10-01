//
//  List.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct List {

    let object: String
    let data: [STP.Card]
    let has_more: Bool
    let total_count: Int
    let url: String

    init?(_ object: [AnyHashable: Any]) {

        guard let obj: String = object["object"] as? String else {
            return nil
        }
        guard let data: [[AnyHashable: Any]] = object["data"] as? [[AnyHashable: Any]] else {
            return nil
        }
        guard let has_more: Bool = object["has_more"] as? Bool else {
            return nil
        }
        guard let total_count: Int = object["total_count"] as? Int else {
            return nil
        }
        guard let url: String = object["url"] as? String else {
            return nil
        }

        self.object = obj
        self.data = data.flatMap { STP.Card($0) }
        self.has_more = has_more
        self.total_count = total_count
        self.url = url

    }
}
