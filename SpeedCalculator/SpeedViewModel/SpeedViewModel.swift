//
//  SpeedViewModel.swift
//  SpeedCalculator
//
//  Created by Connor Engel on 2025-03-03.
//

import Foundation
@Observable

class SpeedViewModel {
    //holds the list of previously computed properties
    var resultHistory : [Speed] = []
    
    //holds the values the user inputs
    var providedDistance : String
    var providedTime : String
    
    // holds the error message if there is a problem with the input
    var recoveryMessage: String = ""
    
    var speed : Speed? {
        
        guard let providedDistance = Double(providedDistance) else {
            recoveryMessage = "Please provide a numeric value for the distance"
            
            return nil
        }
        
        guard let providedTime = Double(providedTime) else {
            recoveryMessage = "Please provide a numeric value for the time."
            
            return nil
        }
        
        guard providedTime != 0 else {
            recoveryMessage = "Time Cant be zero"
            
            return nil
        }
        
        guard providedDistance >= 0 else {
            recoveryMessage = "Distance cant be negative "
            
            return nil
        }
        
        recoveryMessage = "" // no error
        return Speed(distance: providedDistance, time: providedTime)
    }
    
    init(
        resultHistory: [Speed] = [],
        providedDistance: String = "",
        providedTime: String = "",
        recoveryMessage: String = ""
    ) {
        self.resultHistory = resultHistory
        self.providedDistance = providedDistance
        self.providedTime = providedTime
        self.recoveryMessage = recoveryMessage
    }
    
    func saveResult() {
        if let speed = self.speed {
            
            // ... save that evaluated power at the top of the history of
            // results
            //
            // NOTE: By inserting the newly evaluated power at the top of
            //       the array, we ensure the user sees
            //       the most recent result first.
            self.resultHistory.insert(speed, at: 0)
        }
    }
    
    
}
