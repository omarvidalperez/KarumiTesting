//
//  CounterStorageTest.swift
//  Karumi TestTests
//
//  Created by Omar Vidal Pérez on 13/11/2019.
//  Copyright © 2019 Omar Vidal Pérez. All rights reserved.
//

import XCTest
@testable import Karumi_Test

class CounterStorageTest: XCTestCase {
    
    var sut: CounterStorage!

    
    override func setUp() {
        super.setUp()
        sut = CounterStorage()
        sut.clean()
    }

    override func tearDown() {
        sut.clean()
        sut = nil
        super.tearDown()
    }
    
    func test_save_value() {
        let counterValue: Int = 10
        sut.save(counterValue)
        let savedValue = sut.getCounter()
        
        XCTAssertEqual(counterValue, savedValue)
    }
    
    func test_two_values() {
        
        let counterValue1: Int = 10
        let counterValue2: Int = 20
        sut.save(counterValue1)
        sut.save(counterValue2)
        let savedValue = sut.getCounter()
        
        XCTAssertEqual(counterValue2, savedValue)
    }
    
    func test_not_value_saved() {
        let savedValue = sut.getCounter()
        
        XCTAssertEqual(nil, savedValue)
    }
}
