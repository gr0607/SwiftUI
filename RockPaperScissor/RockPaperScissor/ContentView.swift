//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by admin on 07.09.2023.
//

import SwiftUI

struct ContentView: View {
    private let gestures = ["rock", "paper", "scissors"]
    
    @State private var robotChoice = -1
    @State private var yourScore = 0
    @State private var robotScore = 0
    @State private var game = 0
    @State private var endRound = false
    @State private var alertTitle = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("You: \(yourScore)")
                Spacer()
                Text("MrRobot: \(robotScore)")
            } // Hstack
            .padding(10)
            
            Text("Game : \(game)")
            Spacer()
            
            Image(robotChoice == -1 ? "robot" : gestures[robotChoice])
                .resizable()
                .frame(width: 100, height: 100)
            
            Text("Rock, Paper, Scissors?")
                .font(.title)
            
            HStack(spacing: 10.0) {
                ForEach(0..<3) { number in
                    Button {
                        userChoice(number)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            endRound = true
                        }
                        
                    } label: {
                        Image(gestures[number])
                            .resizable()
                            .frame(width: 100, height: 100)
                            .shadow(radius: 10)
                    }
                }
            } // HStack
            Spacer()
        } //Vstack
        .alert(alertTitle, isPresented: $endRound) {
            Button("Continiue", action: startNewRound)
        }
    }
    
    private func userChoice(_ number: Int) {
        print(number)
        robotChoice = Int.random(in: 0...2)
        game += 1
        whoIsWin(number, robotChoice)
    }
    
    private func whoIsWin(_ userNumber: Int, _ robotNumber: Int) {
        if userNumber == robotNumber {
            alertTitle = "No win"
            return }
        
        if userNumber == 0 && robotNumber == 2 {
            yourScore += 1
            alertTitle = "You win"
            return
        }
        
        if userNumber == 2 && robotNumber == 0 {
            robotScore += 1
            alertTitle = "You lose"
            return
        }
        
        if userNumber > robotNumber {
            yourScore += 1
            alertTitle = "You win"
        } else {
            robotScore += 1
            alertTitle = "You lose"
        }
    }
               
    private func startNewRound() {
            robotChoice = -1
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
