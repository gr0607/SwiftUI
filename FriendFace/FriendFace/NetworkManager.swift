//
//  NetworkManager.swift
//  FriendFace
//
//  Created by admin on 16.10.2023.
//

import Foundation

class NetworkManager {
    func loadData() async throws -> [User]{
       
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            throw fatalError("Can't create URL")
        }
        
        let request = URLRequest(url: url)
        
       
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let users = try? decoder.decode([User].self, from: data)
        return users ?? [User]()
    }
}
