//
//  ContentView.swift
//  WeSplit
//
//  Created by admin on 01.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = totalAmount / peopleCount
        
        return amountPerPerson
    }
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    
     var body: some View {
         NavigationView {
             Form {
                
                 Section {
                     TextField("Amount", value:  $checkAmount, format:
                            .currency(code: Locale.current.currencyCode ?? "USD"))
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                     
                     Picker("Number of people", selection: $numberOfPeople) {
                         ForEach(2..<100) {
                             Text("\($0) people")
                         }
                     }
                 }
                 
                 Section {
                     Picker("Tip percentage", selection: $tipPercentage) {
                         ForEach(tipPercentages, id: \.self) {
                             Text($0, format: .percent)
                         }
                     }
                     .pickerStyle(.segmented)
                 } header: {
                     Text("How much tips do you want to tip?")
                 }
                 
                 Section {
                     Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                 } header: {
                     Text("Amount per person")
                 }
                 
                 Section {
                     Text(totalAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                         .foregroundColor(tipPercentage == 0 ? .red : .black)
                 } header: {
                     Text("Total Amount")
                 }

             }
             .navigationTitle("WeSplit")
             .toolbar {
                 ToolbarItemGroup(placement: .keyboard) {
                     Button("Done") {
                         amountIsFocused = false
                     }
                 }
             }
         }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
