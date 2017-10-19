//
//  StripeAPITests.swift
//  StripeAPITests
//
//  Created by 1amageek on 2017/10/01.
//  Copyright © 2017年 Stamp Inc. All rights reserved.
//

import XCTest
//@testable import StripeAPI
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
                        let email: String = "sample@sample.com"
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

    func testAccount() {
        let expectation: XCTestExpectation = XCTestExpectation(description: "Account")
        Account.Create(type: .custom, email: nil, country: Locale.current.regionCode).send { (result) in
            switch result {
            case .success(let response):
                print(response)
                XCTAssertNotNil(response)
                let id: String = response.id
                Account.Retrieve(id: id).send({ (result) in
                    switch result {
                    case .success(let response):
                        XCTAssertEqual(response.id, id)
                        let email: String = "sample@sample.com"
                        var parameters: Account.Update.Parameters = Account.Update.Parameters()
                        parameters.email = email
                        Account.Update(id: id, parameters: parameters).send({ (result) in
                            switch result {
                            case .success(let response):
                                XCTAssertEqual(response.id, id)
                                XCTAssertEqual(response.email, email)
                                Account.Reject(id: id, reason: Account.Reject.Reason.fraud).send({ (result) in
                                    switch result {
                                    case .success(let response):
                                        XCTAssertNotNil(response)
                                        XCTAssertEqual(response.id, id)
                                        XCTAssertEqual(response.verification.disabledReason!.rawValue, "rejected.fraud")
                                        Account.Delete(id: id).send({ (result) in
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
                })
            case .failure(let error): print(error)
            }
        }
        self.wait(for: [expectation], timeout: 5)
    }

    func testProduct() {
        let expectation: XCTestExpectation = XCTestExpectation(description: "Product")
        Product.Create(name: "Product1号").send { (result) in
            switch result {
            case .success(let response):
                print(response)
                XCTAssertNotNil(response)
                let id: String = response.id
                Product.Retrieve(id: id).send({ (result) in
                    switch result {
                    case .success(let response):
                        XCTAssertEqual(response.id, id)
                        let caption: String = "Productのキャプション"
                        var parameters: Product.Update.Parameters = Product.Update.Parameters()
                        parameters.caption = caption
                        Product.Update(id: id, parameters: parameters).send({ (result) in
                            switch result {
                            case .success(let response):
                                XCTAssertEqual(response.id, id)
                                XCTAssertEqual(response.caption, caption)
                                Product.Delete(id: id).send({ (result) in
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
            case .failure(let error):
                print(error)
            }
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }

    func testSKU() {
        let expectation: XCTestExpectation = XCTestExpectation(description: "SKU")
        Product.Create(name: "Product2号").send { (result) in
            switch result {
            case .success(let response):
                print(response)
                XCTAssertNotNil(response)
                let id: String = response.id
                SKU.Create(currency: Currency.JPY,
                           inventory: SKU.Inventory(type: .finite, quantity: 10),
                           price: 1000,
                           product: id).send({ (result) in
                            switch result {
                            case .success(let response):
                                print(response)
                                XCTAssertNotNil(response)
                                expectation.fulfill()
                            case .failure(let error): print(error)
                            }
                           })
            case .failure(let error):
                print(error)
            }
        }
        self.wait(for: [expectation], timeout: 5)
    }

    func testTestModel() {
        let expectation: XCTestExpectation = XCTestExpectation(description: "TestModel")
        SKU.Create(currency: Currency.JPY,
                   inventory: SKU.Inventory(type: .finite, quantity: 10),
                   price: 1000,
                   product: "prod_BbpySqJvKNasSP").send({ (result) in
                    switch result {
                    case .success(let response):
                        print(response)
                        XCTAssertNotNil(response)
                        expectation.fulfill()
                    case .failure(let error): print(error)
                    }
                   })
        self.wait(for: [expectation], timeout: 5)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
