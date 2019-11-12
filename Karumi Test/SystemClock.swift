//
//  SystemClock.swift
//  Karumi Test
//
//  Created by Omar Vidal Pérez on 12/11/2019.
//  Copyright © 2019 Omar Vidal Pérez. All rights reserved.
//

import Foundation

protocol Clock {
    func now() -> Date
}

class SystemClock: Clock {
    func now() -> Date {
        return NSDate.now
    }
}
