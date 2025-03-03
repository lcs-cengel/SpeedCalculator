//
//  Speed.swift
//  SpeedCalculator
//
//  Created by Connor Engel on 2025-03-03.
//

import Foundation

struct Speed {
    var distance: Double
    var time: Double
    
    var speed: Double {
        return distance / time
    }
}
