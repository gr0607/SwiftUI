//
//  UserView.swift
//  FriendFace
//
//  Created by admin on 16.10.2023.
//

import SwiftUI

let testUser = User(id: "err", isActive: false, name: "John", age: 23, about: "wrw", registered: Date(), friends: [Friend(id: "r", name: "te")])

struct UserView: View {
    let user: User
    
    var body: some View {
        HStack {
            Text(user.name)
            Spacer()
            if user.isActive {
                Image(systemName: "person.icloud.fill")
                    .foregroundColor(.green)
            } else {
                Image(systemName: "xmark.icloud.fill")
                    .foregroundColor(.red)
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: testUser)
            .previewLayout(.sizeThatFits)
    }
}
