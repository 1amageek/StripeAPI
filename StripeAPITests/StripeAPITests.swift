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
    
    func testCustomerCreate() {
        let expectation: XCTestExpectation = XCTestExpectation(description: "Customer")
        Customer.Create().send { (result) in
            switch result {
            case .success(let response): print(response)
            case .failure(let error): print(error)
            }
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 10)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
