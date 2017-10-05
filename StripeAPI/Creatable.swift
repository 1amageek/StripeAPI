//
//  Creatable.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/03.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import Result

public protocol Creatable {
    associatedtype Request: StripeAPIRequest
    associatedtype Response: StripeAPI
    func create(_ request: Request, block: (Result<Response, StripeAPIError>))
}

extension Creatable {
    func create(_ request: Request) {

    }
}
