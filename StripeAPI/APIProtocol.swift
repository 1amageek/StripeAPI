//
//  APIProtocol.swift
//  StripeAPI
//
//  Created by nori on 2017/10/16.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation

public protocol APIProtocol {
//    associatedtype Request: StripeAPI
//    associatedtype Response: Decodable
}

public protocol Creatable: APIProtocol {
//    func create(_ request: Request, block: (Result<Response, StripeAPIError>))
}

public protocol Retrievable: APIProtocol {

}

public protocol Updateable: APIProtocol {

}

public protocol Deletable: APIProtocol {

}


public protocol ParamaterRequestable {
    var parameters: [AnyHashable: Any] { get }
}

extension ParamaterRequestable {

    public var parameters: [AnyHashable: Any] {
        let mirror: Mirror = Mirror(reflecting: self)
        return mirror.children.reduce([:]) { (result, child) -> [AnyHashable: Any] in
            var result = result
            if child.value != nil {
                result[child.label!] = child.value
            }
            return result
        }
    }
}
