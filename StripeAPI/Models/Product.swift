//
//  Product.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

struct Product {
    let name: String
    let caption: String?
    let description: String?
    let metadata: [AnyHashable: Any]
    var tax: Double {
        return Double(metadata["tax"] as! String)!
    }

    init?(_ json: [AnyHashable: Any]) {
        guard
            let name = json["name"] as? String,
            let metadata = json["metadata"] as? [AnyHashable: Any] else
        {
            return nil
        }
        self.name = name
        self.caption = json["caption"] as? String
        self.description = json["description"] as? String
        self.metadata = metadata
    }
}
