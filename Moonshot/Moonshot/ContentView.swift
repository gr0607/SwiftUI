//
//  ContentView.swift
//  Moonshot
//
//  Created by admin on 21.09.2023.
//

import SwiftUI




struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        VStack {
            Text("\(astronauts.count)")
                .padding()
            Text("\(missions.count)")
        }
         
    }//body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
