//
//  SessionInteractor.swift
//  Karumi Test
//
//  Created by Omar Vidal Pérez on 12/11/2019.
//  Copyright © 2019 Omar Vidal Pérez. All rights reserved.
//

import Foundation

protocol SessionInteractorProtocol {
    func logIn(user: String, pass: String) -> Bool
    func logOut() -> Bool
}

class SessionInteractor: SessionInteractorProtocol {
    
    private var clock: Clock
    
    init(clock: Clock) {
        self.clock = clock
    }
    
    func logIn(user: String, pass: String) -> Bool {
        if user == "galicia" && pass == "lloviendo" {
            return true
        }
        return false
    }
    
    func logOut() -> Bool {
        return Int(clock.now().timeIntervalSince1970)%2 == 0
    }
}
