//
//  Speed.swift
//  SpeedCalculator
//
//  Created by Connor Engel on 2025-03-03.
//

import Foundation

struct Speed: Identifiable {
    var id = UUID()
    var distance: Double
    var time: Double
    
    var speed: Double {
        return distance / time
    }
}
