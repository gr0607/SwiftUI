//
//  ContentView.swift
//  FriendFace
//
//  Created by admin on 16.10.2023.
//

import SwiftUI

struct ContentView: View {
    private let networkManager = NetworkManager()
    @State private var users: [User] = [User]()
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink(destination: UserDetailView(user: user)) {
                        UserView(user: user)
                    }
                }
            }
           // .listStyle(.grouped)
            .task {
                await loadData()
            }
            .navigationTitle("Friends")
        }//NavigationView
    }
        
    
    func loadData() async {
        do {
            if users.isEmpty {
                self.users = try await networkManager.loadData()
            }
        } catch {
            print("fatal error")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
