//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by admin on 29.09.2023.
//

import SwiftUI


struct ContentView: View {
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creatng Account")
                }
            }
            .disabled(username.isEmpty || email.isEmpty)
        }
    }//Body
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
