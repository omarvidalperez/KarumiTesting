//
//  StringCalculatorTest.swift
//  Karumi TestTests
//
//  Created by Omar Vidal Pérez on 12/11/2019.
//  Copyright © 2019 Omar Vidal Pérez. All rights reserved.
//

import XCTest
@testable import Karumi_Test

class StringCalculatorTest: XCTestCase {

    let sut = StringCalculator()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    private let scenarios = [("", 0), ("11", 11), ("11,22", 33), ("11,22,33", 66), ("11\n22", 33)]
    
    func test_run_all_scenarios() throws {

        for scenario in scenarios {
             try evaluateStringCalculator(value: scenario.0, expected: scenario.1)
        }
    }

//    func test_return_zero_if_string_is_empty() {
//
//        evaluateStringCalculator(value: "", expected: 0)
//    }
//
//    func test_return_the_correct_number_when_is_one_value() {
//
//        evaluateStringCalculator(value: "11", expected: 11)
//    }
//
//    func test_return_the_sum_of_numbers_separated_by_coma() {
//
//        evaluateStringCalculator(value: "11,22", expected: 33)
//    }
//
//    func test_return_the_sum_of_numbers_separated_new_line() {
//
//        evaluateStringCalculator(value: "11\n22", expected: 33)
//    }
    
    func test_exceptiomn_with_negative_number() throws {
        
        XCTAssertThrowsError( try sut.add("-11"))
    }
    
    private func evaluateStringCalculator(value: String, expected: Int) throws {
        let result = try sut.add(value)
         XCTAssertEqual(result, expected)
    }
}
