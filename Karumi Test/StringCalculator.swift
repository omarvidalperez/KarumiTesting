//
//  StringCalculator.swift
//  Karumi Test
//
//  Created by Omar Vidal Pérez on 12/11/2019.
//  Copyright © 2019 Omar Vidal Pérez. All rights reserved.
//

import Foundation

class StringCalculator {
    
    public func add(_ value: String) throws -> Int {
        
        let validString = value.replacingOccurrences(of: "\n", with: ",")        
        let valuesAsStringArray = validString.components(separatedBy: ",")
        let mappedValues = valuesAsStringArray.map { Int($0) ?? 0 }
        let value =  try mappedValues.reduce(0) { (result, a) -> Int in
            if a < 0 {
                throw NSError()
            } else {
                return result + (a)
            }
        }
        return value
    }
}
