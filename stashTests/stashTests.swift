//
//  stashTests.swift
//  stashTests
//
//  Created by User on 12/10/18.
//  Copyright © 2018 jonathanking. All rights reserved.
//

import XCTest
@testable import stash

class stashTests: XCTestCase {
    
    func testReuseIdentifier() {
        XCTAssertEqual(reuseIdentifier, "Cell")
        XCTAssertEqual(ListInteractor.title, Constants.title)
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
