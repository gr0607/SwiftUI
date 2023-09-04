//
//  ContentView.swift
//  Converter
//
//  Created by admin on 04.09.2023.
//

import SwiftUI

enum Temperature: String, CaseIterable {
    case celsius, farenheit, kelvin
    
    static func cFromK(from number: Double) -> Double {
        number - 273.15
    }
    
    static func cFromF(from number: Double) -> Double {
        (32 * number - 32) * 5 / 9
    }
    
    static func kFromC(from number: Double) -> Double {
        number + 273
    }
    
    static func kFromF(from number: Double) -> Double {
        (32 * number - 32) * 5 / 9 + 273.15
    }
    
    static func fFromC(from number: Double) -> Double {
        (number * 9 / 5) + 32
    }
    
    static func fFromK(from number: Double) -> Double {
        (number - 273.15) * 9 / 5 + 32
    }
}


struct ContentView: View {

    @State private var selectedOption: Temperature = .celsius
    
    @State private var start = ""
    
    var celsius: Double {
        guard let num = Double(start) else { return 0.0}
        switch selectedOption {
        case .celsius: return num
        case .farenheit: return Temperature.cFromF(from: num)
        case .kelvin: return Temperature.cFromK(from: num)
        }
    }
    
    var kelvin: Double {
        guard let num = Double(start) else { return 0.0}
        switch selectedOption {
        case .celsius: return Temperature.kFromC(from: num)
        case .farenheit: return Temperature.kFromF(from: num)
        case .kelvin: return num
        }
    }
    
    var farenheit: Double {
        guard let num = Double(start) else { return 0.0}
        switch selectedOption {
        case .celsius: return Temperature.fFromC(from: num)
        case .farenheit: return num
        case .kelvin: return Temperature.kFromF(from: num)
        }
    }
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    TextField("Input and select temperature" , text: $start)
                        .keyboardType(.decimalPad)
                    
                    Picker("I 'm picker", selection: $selectedOption) {
                        ForEach(Temperature.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Text("\(celsius.formatted()) celsius")
                    Text("\(kelvin.formatted())  kelvin")
                    Text("\(farenheit.formatted()) farnheit")
                }
            }
            
          
            
                .navigationTitle("Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
