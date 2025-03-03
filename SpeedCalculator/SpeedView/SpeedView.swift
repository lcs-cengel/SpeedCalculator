//
//  ContentView.swift
//  SpeedCalculator
//
//  Created by Connor Engel on 2025-03-03.
//

import SwiftUI

struct SpeedView: View {
    
    @State var viewModel = SpeedViewModel()
    
    var body: some View {
        VStack {
            if let calculatedResult  = viewModel.speed {
                
                VStack(spacing: 0) {
                    
                    FahrenheitToCelsiusConversionItemView(conversionResult: conversionResult)
                        .padding(.bottom, 30)
                    
                    // Add a button so that the result can be saved
                    Button {
                        viewModel.saveResult()
                        // DEBUG: Show how many items are in the resultHistory array
                        print("There are \(viewModel.resultHistory.count) elements in the resultHistory array.")
                    } label: {
                        Text("Save")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom)
                }
                .frame(height: 250)
                
            } else {
                ContentUnavailableView("Unable to perform conversion", systemImage: "gear.badge.questionmark", description: Text(viewModel.recoveryMessage))
                    .frame(height: 250)

            }
            
            // INPUT
            TextField("Enter a temperature in Fahrenheit", text: $viewModel.providedFarenheight)
                .textFieldStyle(.roundedBorder)
            
            HStack {
                Text("History")
                    .font(.title2)
                    .bold()
                
                Spacer()
            }
            .padding(.top)
            
            // Iterate over the list of results
            List(viewModel.resultHistory) { currentResult in
                
                FahrenheitToCelsiusConversionItemView(conversionResult: currentResult)
                
            }
            .listStyle(.plain)
            
            
        }
        .navigationTitle("Temperature Converter")
        .padding()
    }
}

#Preview {
    SpeedView()
}
