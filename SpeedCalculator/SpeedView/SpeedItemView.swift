//
//  SpeedItemView.swift
//  SpeedCalculator
//
//  Created by Connor Engel on 2025-03-03.
//

import SwiftUI

struct SpeedItemView: View {
    
    // MARK: Stored properties
    let calculatedResult: Speed
    
    // MARK: Computed properties
    var body: some View {
        
        HStack(spacing: 0) {
            Text("\(calculatedResult.distance.formatted(.number.precision(.significantDigits(1...3)))) Meters")
            
            Text(" = \(calculatedResult.time.formatted(.number.precision(.significantDigits(1...3)))) Seconds")
        }
        .font(.largeTitle)
        
    }
    
}


