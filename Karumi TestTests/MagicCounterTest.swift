//
//  MagicCounterTest.swift
//  Karumi TestTests
//
//  Created by Omar Vidal Pérez on 13/11/2019.
//  Copyright © 2019 Omar Vidal Pérez. All rights reserved.
//

import XCTest
@testable import Karumi_Test

class MagicCounterTest: XCTestCase {
    
    var sut: MagicCounter!
    var random: MockRandomNumber!
    var storage: CounterStorageProtocol!

    
    override func setUp() {
        super.setUp()
        storage = CounterStorage()
        storage.clean()
        random = MockRandomNumber()
        sut = MagicCounter(counterStorage: storage, randomNumber: random)
    }

    override func tearDown() {
        storage.clean()
        storage = nil
        random = nil
        sut = nil
        super.tearDown()
    }
    
    func test_increment_less_than_100() {
        random.value = 10
        let value = sut.increment()
        XCTAssertEqual(value, 1)
    }
    
    func test_increment_more_than_100() {
        random.value = 101
        let value = sut.increment()
        XCTAssertEqual(value, 101)
    }
    
    func test_decrement() {
        random.value = 105
        _ = sut.increment()
        let value = sut.decrement()
        XCTAssertEqual(value, 104)
    }
    
    func test_decrement_equal_zero() {
        random.value = 45
        _ = sut.increment()
        let value = sut.decrement()
        XCTAssertEqual(value, 0)
    }
}

class MockRandomNumber: RandomNumberProtocol {
    
    var value: Int!
    
    func getRandom() -> Int {
        return value
    }
}
