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

    let configure: Configuration = Configuration(apiKey: TestConfiguration.secretKey)

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

    /**
     This test can not be executed with API Key.
    */
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
                let productID: String = response.id
                SKU.Create(currency: Currency.JPY,
                           inventory: SKU.Inventory(quantity: 10),
                           price: 1000,
                           product: productID).send({ (result) in
                            switch result {
                            case .success(let response):
                                XCTAssertNotNil(response)
                                var parameters: SKU.Update.Parameters = SKU.Update.Parameters()
                                let id: String = response.id
                                let price: Double = 10000
                                parameters.price = price
                                SKU.Update(id: id, parameters: parameters).send({ (result) in
                                    switch result {
                                    case .success(let response):
                                        XCTAssertNotNil(response)
                                        XCTAssertEqual(response.price, price)
                                        SKU.Delete(id: id).send({ (result) in
                                            switch result {
                                            case .success(let response):
                                                XCTAssertNotNil(response)
                                                XCTAssertEqual(response.id, id)
                                                XCTAssertEqual(response.deleted, true)
                                                Product.Delete(id: productID).send({ (result) in
                                                    switch result {
                                                    case .success(let response):
                                                        XCTAssertNotNil(response)
                                                        XCTAssertEqual(response.id, productID)
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
            case .failure(let error):
                print(error)
            }
        }
        self.wait(for: [expectation], timeout: 8)
    }

    func testSource() {
        let expectation: XCTestExpectation = XCTestExpectation(description: "Source")
        Source.Create(type: .bitcoin).send({ (result) in
            switch result {
            case .success(let response):
                print(response)
                expectation.fulfill()
            case .failure(let error): print(error)
            }
        })
        self.wait(for: [expectation], timeout: 5)
    }

    func testOrder() {
        let expectation: XCTestExpectation = XCTestExpectation(description: "Order")
        var params: Customer.Create.Parameters = Customer.Create.Parameters()
        params.email = "sample@sample.com"
        Customer.Create(parameters: params).send { (result) in
            switch result {
            case .success(let response):
                let customerID: String = response.id
                Card.Create(customerID: customerID, expMonth: "10", expYear: "2020", number: "4242424242424242", currency: .JPY, cvc: "123").send({ (result) in
                    switch result {
                    case .success(let response):
                        XCTAssertNotNil(response)
                        Product.Create(name: "Product3号").send { (result) in
                            switch result {
                            case .success(let response):
                                print(response)
                                XCTAssertNotNil(response)
                                let productID: String = response.id
                                SKU.Create(currency: Currency.JPY,
                                           inventory: SKU.Inventory(quantity: 10),
                                           price: 1000,
                                           product: productID).send({ (result) in
                                            switch result {
                                            case .success(let response):
                                                XCTAssertNotNil(response)
                                                let orderItem = Order.Create.Parameters.OrderItem(type: .sku, parent: response.id)
                                                let address: Address = Address(city: "ebisu", country: "jp", line1: "shibuya-ku", line2: nil, postalCode: "150-6012", state: "tokyo")
                                                let shipping: Shipping = Shipping(address: address, name: "クック太郎", phone: "090-0000-0000")
                                                var parameters = Order.Create.Parameters(currency: .JPY)
                                                parameters.items = [orderItem]
                                                parameters.shipping = shipping

                                                Order.Create(parameters: parameters).send({ (result) in
                                                    switch result {
                                                    case .success(let response):
                                                        print(response)
                                                        XCTAssertNotNil(response)
                                                        Order.Pay(id: response.id, customer: customerID).send({ (result) in
                                                            switch result {
                                                            case .success(let response):
                                                                print(response)
                                                                XCTAssertNotNil(response)
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
                        }
                    case .failure(let error):
                        print(error)
                    }
                })
            case .failure(let error): print(error)
            }
        }
        self.wait(for: [expectation], timeout: 8)
    }

    func testCard() {
        let expectation: XCTestExpectation = XCTestExpectation(description: "Card")
        Customer.Create().send { (result) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                let customerID: String = response.id
                Card.Create(customerID: customerID, expMonth: "10", expYear: "2020", number: "4242424242424242", currency: .JPY, cvc: "123").send({ (result) in
                    switch result {
                    case .success(let response):
                        XCTAssertNotNil(response)
                        let cardID: String = response.id
                        Card.Retrieve(customerID: customerID, id: cardID).send({ (result) in
                            switch result {
                            case .success(let response):
                                XCTAssertNotNil(response)
                                XCTAssertEqual(response.id, cardID)
                                let param: Card.Update.Parameters = Card.Update.Parameters(addressCity: nil, addressCountry: nil, addressLine1: nil, addressLine2: nil, addressState: nil, addressZip: nil, expMonth: "10", expYear: "2021", metadata: nil, name: nil)
                                Card.Update(customerID: customerID, id: cardID, parameters: param).send({ (result) in
                                    switch result {
                                    case .success(let response):
                                        XCTAssertNotNil(response)
                                        XCTAssertEqual(response.id, cardID)
                                        Card.Delete(customerID: customerID, id: cardID).send({ (result) in
                                            switch result {
                                            case .success(let response):
                                                XCTAssertNotNil(response)
                                                XCTAssertEqual(response.id, cardID)
                                                XCTAssertEqual(response.deleted, true)
                                                Customer.Delete(id: customerID).send({ (result) in
                                                    switch result {
                                                    case .success(let response):
                                                        XCTAssertNotNil(response)
                                                        XCTAssertEqual(response.id, customerID)
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
                })
            case .failure(let error): print(error)
            }
        }
        self.wait(for: [expectation], timeout: 8)
    }

    func testBalance() {
        let expectation: XCTestExpectation = XCTestExpectation(description: "Balance")
        Balance.Retrieve().send { (result) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                XCTAssertEqual(response.object, "balance")
                expectation.fulfill()
            case .failure(let error): print(error)
            }
        }
        self.wait(for: [expectation], timeout: 8)
    }

    func testCharge() {
        let expectation: XCTestExpectation = XCTestExpectation(description: "Charge")
        Customer.Create().send { (result) in
            switch result {
            case .success(let response):
                print(response)
                XCTAssertNotNil(response)
                let customerID: String = response.id
                Card.Create(customerID: customerID, expMonth: "10", expYear: "2020", number: "4242424242424242", currency: .JPY, cvc: "123").send({ (result) in
                    switch result {
                    case .success(let response):
                        XCTAssertNotNil(response)
                        Charge.Create(amount: 1000, currency: .JPY, customer: customerID).send({ (result) in
                            switch result {
                            case .success(let response):
                                XCTAssertNotNil(response)
                                let id: String = response.id
                                Charge.Retrieve(id: id).send({ (result) in
                                    switch result {
                                    case .success(let response):
                                        XCTAssertNotNil(response)
                                        XCTAssertEqual(response.id, id)
                                        var params: Charge.Update.Parameters = Charge.Update.Parameters()
                                        let description: String = "description"
                                        params.description = description
                                        Charge.Update(id: id, parameters: params).send({ (result) in
                                            switch result {
                                            case .success(let response):
                                                XCTAssertNotNil(response)
                                                XCTAssertEqual(response.id, id)
                                                XCTAssertEqual(response.description, description)
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

    func testChargeCapture() {
        let expectation: XCTestExpectation = XCTestExpectation(description: "ChargeCapture")
        Customer.Create().send { (result) in
            switch result {
            case .success(let response):
                print(response)
                XCTAssertNotNil(response)
                let customerID: String = response.id
                Card.Create(customerID: customerID, expMonth: "10", expYear: "2020", number: "4242424242424242", currency: .JPY, cvc: "123").send({ (result) in
                    switch result {
                    case .success(let response):
                        XCTAssertNotNil(response)
                        let cardID: String = response.id
                        var params: Charge.Create.Parameters = Charge.Create.Parameters(amount: 1000, currency: .JPY, customer: customerID)
                        params.capture = false
                        Charge.Create(parameters: params).send({ (result) in
                            switch result {
                            case .success(let response):
                                XCTAssertNotNil(response)
                                Charge.Capture(id: response.id).send({ (result) in
                                    switch result {
                                    case .success(let response):
                                        XCTAssertNotNil(response)
                                        Card.Delete(customerID: customerID, id: cardID).send({ (result) in
                                            switch result {
                                            case .success(let response):
                                                XCTAssertNotNil(response)
                                                XCTAssertEqual(response.id, cardID)
                                                XCTAssertEqual(response.deleted, true)
                                                Customer.Delete(id: customerID).send({ (result) in
                                                    switch result {
                                                    case .success(let response):
                                                        XCTAssertNotNil(response)
                                                        XCTAssertEqual(response.id, customerID)
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
                })
            case .failure(let error): print(error)
            }
        }
        self.wait(for: [expectation], timeout: 5)
    }

//    func testBalanceTrasaction() {
//        let expectation: XCTestExpectation = XCTestExpectation(description: "BalanceTransaction")
//        BalanceTransaction.Retrieve(id: ).send { (result) in
//            switch result {
//            case .success(let response):
//                XCTAssertNotNil(response)
//                XCTAssertEqual(response.object, "balance")
//                expectation.fulfill()
//            case .failure(let error): print(error)
//            }
//        }
//        self.wait(for: [expectation], timeout: 8)
//    }

    func testBankAccount() {
        let expectation: XCTestExpectation = XCTestExpectation(description: "Card")
        Customer.Create().send { (result) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                let customerID: String = response.id
                let name: String = "Jane Austen"
                var param: BankAccount.Create.Parameters = BankAccount.Create.Parameters(accountNumber: "000123456789", country: Locale.current.regionCode!, currency: .USD)
                param.source.routingNumber = "110000000"
                param.source.accountHolderName = name
                param.source.accountHolderType = .individual
                BankAccount.Create(customerID: customerID, parameters: param).send({ (result) in
                    switch result {
                    case .success(let response):
                        XCTAssertNotNil(response)
                        let sourceID: String = response.id
                        BankAccount.Retrieve(customerID: customerID, id: sourceID).send({ (result) in
                            switch result {
                            case .success(let response):
                                XCTAssertNotNil(response)
                                XCTAssertEqual(response.id, sourceID)
                                let changeName: String = "aaaa bbbb"
                                var param: BankAccount.Update.Parameters = BankAccount.Update.Parameters()
                                param.accountHolderName = changeName
                                BankAccount.Update(customerID: customerID, id: sourceID, parameters: param).send({ (result) in
                                    switch result {
                                    case .success(let response):
                                        XCTAssertNotNil(response)
                                        XCTAssertEqual(response.id, sourceID)
                                        XCTAssertEqual(response.accountHolderName, changeName)
                                        BankAccount.Delete(customerID: customerID, id: sourceID).send({ (result) in
                                            switch result {
                                            case .success(let response):
                                                XCTAssertNotNil(response)
                                                XCTAssertEqual(response.id, sourceID)
                                                XCTAssertEqual(response.deleted, true)
                                                Customer.Delete(id: customerID).send({ (result) in
                                                    switch result {
                                                    case .success(let response):
                                                        XCTAssertNotNil(response)
                                                        XCTAssertEqual(response.id, customerID)
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
                })
            case .failure(let error): print(error)
            }
        }
        self.wait(for: [expectation], timeout: 8)
    }

    func testTestModel() {
        let expectation: XCTestExpectation = XCTestExpectation(description: "TestModel")
        let orderItem = Order.Create.Parameters.OrderItem(type: .sku, parent: "sku_Bc8rj7W8lwdhf7")
        let address: Address = Address(city: "ebisu", country: "jp", line1: "shibuya-ku", line2: nil, postalCode: "150-6012", state: "tokyo")
        let shipping: Shipping = Shipping(address: address, name: "クック太郎", phone: "090-0000-0000")
        var parameters = Order.Create.Parameters(currency: .JPY)
        parameters.items = [orderItem]
        parameters.shipping = shipping

        Order.Create(parameters: parameters).send({ (result) in
            switch result {
            case .success(let response):
                print(response)
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
