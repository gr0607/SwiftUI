//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by admin on 06.09.2023.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            
    }
}

extension View {
    func titleStyleMy() -> some View {
        self.modifier(Title())
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello")
            .titleStyleMy()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

