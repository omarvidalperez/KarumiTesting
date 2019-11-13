//
//  MagicCounter.swift
//  Karumi Test
//
//  Created by Omar Vidal Pérez on 13/11/2019.
//  Copyright © 2019 Omar Vidal Pérez. All rights reserved.
//

import Foundation

protocol MagicCounterProtocol {
    func increment() -> Int
    func decrement() -> Int
}

class MagicCounter: MagicCounterProtocol {
    
    let counter: CounterStorageProtocol
    let random: RandomNumberProtocol
    
    init(counterStorage: CounterStorageProtocol = CounterStorage(),
         randomNumber: RandomNumberProtocol = RandomNumber()) {
        self.counter = counterStorage
        self.random = randomNumber
    }
    
    func increment() -> Int {
        
        let randomNumber = random.getRandom()
        var value = counter.getCounter() ?? 0
        
        if randomNumber < 100 {
            value += 1
        } else {
            value += randomNumber
        }
        counter.save(value)
        return counter.getCounter() ?? 0
    }
    
    func decrement() -> Int {
        let value = (counter.getCounter() ?? 0) - 1
        counter.save(value)
        return counter.getCounter() ?? 0
        
    }
}
