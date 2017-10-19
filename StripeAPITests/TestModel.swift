//
//  TestModel.swift
//  StripeAPITests
//
//  Created by nori on 2017/10/19.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit

public struct TestModel: StripeModel, ListProtocol {

    public static var path: String { return "/accounts"}

    let a: String

}

extension TestModel {

    public struct Create: StripeParametersAPI {

        public typealias Response = Customer

        public var method: HTTPMethod { return .post }

        public var path: String { return Customer.path }

        public var _parameters: Any?

        public init() {
            self._parameters = Parameters()
        }

        public init(parameters: Parameters) {
            self._parameters = parameters
        }

        public struct Parameters: Codable {
            public var type: String = "custom"
        }
    }
}
