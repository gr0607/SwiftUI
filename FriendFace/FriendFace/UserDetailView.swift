//
//  UserDetailView.swift
//  FriendFace
//
//  Created by admin on 16.10.2023.
//

import SwiftUI



struct UserDetailView: View {
    let user: User
    
    var body: some View {
   //     NavigationView {
            Text("Hello \(user.name)")
                .navigationBarTitle("Detail info")
                .navigationBarTitleDisplayMode(.inline)
   //     }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: testUser1)
    }
}

let testUser1 = User(id: "f58db795-dc50-4628-9542-4a0dd07e74c3", isActive: false, name: "Tabitha Humphrey", age: 23, about: "Dolor excepteur quis nisi aliquip irure aute aliqua tempor consectetur occaecat cillum elit cillum minim. Ut id eiusmod excepteur officia mollit fugiat tempor ex. Labore cupidatat aliquip esse nisi deserunt duis pariatur dolor ut est nulla veniam mollit. Sint laboris eiusmod laborum proident aliquip duis sint amet. Ad eiusmod minim adipisicing proident irure irure. Labore consequat mollit consequat ad duis enim veniam amet. Ea pariatur velit dolor ut est nostrud nulla ullamco dolor.", registered: Date(), friends:
                        [Friend(id: "eccdf4b8-c9f6-4eeb-8832-28027eb70155", name: "Gale Dyer"),
                        Friend(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0", name: "Hawkins Patel")])
