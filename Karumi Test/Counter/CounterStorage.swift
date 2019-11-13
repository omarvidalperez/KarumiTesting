//
//  CounterStorage.swift
//  Karumi Test
//
//  Created by Omar Vidal Pérez on 13/11/2019.
//  Copyright © 2019 Omar Vidal Pérez. All rights reserved.
//

import Foundation

protocol CounterStorageProtocol {
    func save(_ counter: Int)
    func getCounter() -> Int?
    func clean()
}

class CounterStorage: CounterStorageProtocol {
    
    let preferences = UserDefaults.standard
    let counterKey: String = "counter"
    
    func save(_ counter: Int) {
        preferences.set(counter, forKey: counterKey)
    }
    
    func getCounter() -> Int? {
        let counter = preferences.value(forKey: counterKey)
        return counter as? Int
    }
    
    func clean() {
        preferences.removeObject(forKey: counterKey)
    }
}
