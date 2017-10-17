//
//  StripeAPITests.swift
//  StripeAPITests
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import XCTest
@testable import StripeAPI
import APIKit

class StripeAPITests: XCTestCase {

    let configure: Configuration = Configuration(secretKey: TestConfiguration.secretKey)

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func testCustomer() {
        let expectation: XCTestExpectation = XCTestExpectation(description: "Customer")
        Customer.Create().send { (result) in
            switch result {
            case .success(let response):
                print(response)
                XCTAssertNotNil(response)
                let id: String = response.id
                Customer.Retrieve(id: id).send({ (result) in
                    switch result {
                    case .success(let response):
                        XCTAssertEqual(response.id, id)
                        let email: String = "sample@com"
                        var parameters: Customer.Update.Parameters = Customer.Update.Parameters()
                        parameters.email = email
                        Customer.Update(id: id, parameters: parameters).send({ (result) in
                            switch result {
                            case .success(let response):
                                XCTAssertEqual(response.id, id)
                                XCTAssertEqual(response.email, email)
                                Customer.Delete(id: id).send({ (result) in
                                    switch result {
                                    case .success(let response):
                                        XCTAssertNotNil(response)
                                        XCTAssertEqual(response.id, id)
                                        XCTAssertEqual(response.deleted, true)
                                        expectation.fulfill()
                                    case .failure(let error): print(error)
                                    }
                                })
                            case .failure(let error): print(error)
                            }
                        })
                    case .failure(let error): print(error)
                    }
                })
            case .failure(let error): print(error)
            }
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
