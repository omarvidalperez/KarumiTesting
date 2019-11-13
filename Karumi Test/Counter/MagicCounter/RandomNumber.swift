//
//  RandomNumber.swift
//  Karumi Test
//
//  Created by Omar Vidal Pérez on 13/11/2019.
//  Copyright © 2019 Omar Vidal Pérez. All rights reserved.
//

import Foundation

protocol RandomNumberProtocol {
    func getRandom() -> Int
}

class RandomNumber: RandomNumberProtocol {
    
    func getRandom() -> Int {
        return Int.random(in: 0 ..< 1000)
    }
}
