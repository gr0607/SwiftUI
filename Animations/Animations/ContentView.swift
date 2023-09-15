//
//  ContentView.swift
//  Animations
//
//  Created by admin on 14.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingRed = false
   
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }

            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.scale)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
