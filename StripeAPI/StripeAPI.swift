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

/**
 Stripe Model
 Stripe model supports coding possibilities
 */
public typealias StripeModel = Codable

public protocol StripeAPI: Request {

    associatedtype Parameters = Void
}

public protocol ListProtocol {

    static var path: String { get }
}

extension StripeAPI {

    public var baseURL: URL {
        return URL(string: "https://api.stripe.com/v1")!
    }

    public var headerFields: [String : String] {
        return ["authorization": "Bearer \(secretKey)"]
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

// MARK: -

public protocol ParametersProtocol {

    var _parameters: Any? { get set }
}

public typealias StripeParametersAPI = ParametersProtocol & StripeAPI

public extension StripeAPI where Parameters: Encodable, Self: ParametersProtocol {

    public var parameters: Any? { return _parameters }

    public var bodyParameters: BodyParameters? {
        guard let parameters = self.parameters as? Parameters else  {
            return nil
        }
        let data: Data = try! JSONEncoder().encode(parameters)
        let json: [String: Any] = try! JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as! [String : Any]
        return URLEncodedBodyParameters(formObject: json)
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

final class DecodableDataParser: DataParser {
    var contentType: String? {
        return "application/json"
    }

    func parse(data: Data) throws -> Any {
        return data
    }
}

public struct URLEncodedBodyParameters: BodyParameters {
    /// The form object to be serialized.
    public let form: [String: Any]

    /// The string encoding of the serialized form.
    public let encoding: String.Encoding

    /// Returns `FormURLEncodedBodyParameters` that is initialized with form object and encoding.
    public init(formObject: [String: Any], encoding: String.Encoding = .utf8) {
        self.form = formObject
        self.encoding = encoding
    }

    // MARK: - BodyParameters

    /// `Content-Type` to send. The value for this property will be set to `Accept` HTTP header field.
    public var contentType: String {
        return "application/x-www-form-urlencoded"
    }

    /// Builds `RequestBodyEntity.data` that represents `form`.
    /// - Throws: `URLEncodedSerialization.Error` if `URLEncodedSerialization` fails to serialize form object.
    public func buildEntity() throws -> RequestBodyEntity {
        return .data(try _URLEncodedSerialization.data(from: form, encoding: encoding))
    }
}


extension StripeAPI {
    public func intercept(urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.timeoutInterval = 10.0

        print("requestURL: \(urlRequest)")
        print("requestHeader: \(urlRequest.allHTTPHeaderFields!)")
        print("requestBody: \(String(data: urlRequest.httpBody ?? Data(), encoding: .utf8).debugDescription)")
        return urlRequest
    }

    public func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        print("raw response header: \(urlResponse)")
        print("raw response header: \(urlResponse.allHeaderFields)")
        print("raw response body: \(object)")

        if let data: Data = object as? Data {
//            let json = try! JSONSerialization.data(withJSONObject: data, options: [])
//            print("raw response body", json)
            print("raw response body: \(String(data: data ?? Data(), encoding: .utf8).debugDescription)")
        }

        switch urlResponse.statusCode {
        case 200..<300:
            return object

        default:
            throw ResponseError.unacceptableStatusCode(urlResponse.statusCode)
        }
    }
}
