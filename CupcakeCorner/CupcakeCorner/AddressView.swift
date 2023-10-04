//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by admin on 03.10.2023.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    

    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }//Section
            
            Section {
                NavigationLink {
                    CheckOutView(order: order)
                } label: {
                    Text("Check out")
                }
            }//Section
            .disabled(order.hasValidAddress == false)
        }//Form
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(order: Order())
        }
    }
}
