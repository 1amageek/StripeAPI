//
//  API.swift
//  StripeAPI
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import Foundation
import APIKit
import Stripe
import Result

public protocol StripeAPI: Request {
    associatedtype Paramaters = Void
}

public extension StripeAPI where Paramaters == Void {

}

public extension StripeAPI where Paramaters: Encodable {
    public var bodyParameters: BodyParameters? {
        guard let parameters = self.parameters as? Paramaters else  {
            return nil
        }
        return StripeAPIEncoder(from: parameters)
    }
}

extension StripeAPI where Response: Decodable {
    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data: Data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        if let string = String(data: data, encoding: .utf8) {
            print("response: \(string)")
        }
        return try JSONDecoder().decode(Response.self, from: data)
    }
}

extension StripeAPI {

    public var baseURL: URL {
        return URL(string: "https://api.stripe.com/v1")!
    }

    public var headerFields: [String : String] {
        return ["authorization": "Basic \(encodedKey)"]
    }

    public var secretKey: String {
        return Configuration.shared.secretKey
    }

    var encodedKey: String {
        let data: Data = self.secretKey.data(using: String.Encoding.utf8)!
        return data.base64EncodedString()
    }

    public var bodyParameters: BodyParameters? {
        guard let parameters = self.parameters as? [String: Any], !self.method.prefersQueryParameters else {
            return nil
        }
        return FormURLEncodedBodyParameters(formObject: parameters)
    }

    public var dataParser: DataParser {
        return DecodableDataParser()
    }

    @discardableResult
    public func send(_ block: @escaping (Result<Self.Response, SessionTaskError>) -> Void) -> SessionTask? {
        return Session.send(self, callbackQueue: .main, handler: block)
    }
}

final class StripeAPIEncoder<T: Encodable>: BodyParameters {

    typealias Parameters = T

    var contentType: String {
        return "application/json"
    }

    let from: Parameters

    init(from: Parameters) {
        self.from = from
    }

    func buildEntity() throws -> RequestBodyEntity {
        return .data(try JSONEncoder().encode(from))
    }
}

public enum StripeAPIError: Error {
    case network
}

final class DecodableDataParser: DataParser {
    var contentType: String? {
        return "application/json"
    }

    func parse(data: Data) throws -> Any {
        return data
    }
}
