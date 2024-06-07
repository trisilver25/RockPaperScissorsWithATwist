//
//  ContentView.swift
//  RockPaperScissorsWithATwist
//
//  Created by Tristin Smith on 6/6/24.
//

import SwiftUI

struct ContentView: View {
    @State private var gameChoices = ["🪨", "📄", "✂️"].shuffled()
    
    @State private var roboAnswer = Int.random( in: 0...2)
    
    @State private var winOrLose = Bool.random() ? "Win" : "Lose"
    
    @State private var correct = false
    
    @State private var hidden = false
    
    
    
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(colors: [.red, .green, .blue], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        NavigationLink(destination: infoGuide()) {
                            Image(systemName: "info.circle")
                        }
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.black)
                        .font(.title2)
                    }
                    Text("🤖")
                        .font(.system(size: 100))
                    Text("Beep boop, I'll use: \(gameChoices[roboAnswer])")
                        .font(.system(size: 30))
                    Text("You need to: \(winOrLose)")
                        .font(.system(size: 30))
                        .frame(height: 30)
                    VStack(spacing: 30) {
                        Button {
                            checkRock(gameChoices[roboAnswer])
                        } label: {
                            Text(" Rock: 🪨 ")
                                .foregroundStyle(.black)
                        }
                        .background(.red.gradient)
                        .clipShape(.capsule)
                        .font(.system(size: 30))
                        
                        Button {
                            checkPaper(gameChoices[roboAnswer])
                        } label: {
                            Text(" Paper: 📄 ")
                                .foregroundStyle(.black)
                        }
                        .background(.mint.gradient)
                        .clipShape(.capsule)
                        .font(.system(size: 30))
                        
                        Button {
                            checkScissors(gameChoices[roboAnswer])
                        } label: {
                            Text(" Scissors: ✂️ ")
                                .foregroundStyle(.black)
                        }
                        .background(.green.gradient)
                        .clipShape(.capsule)
                        .font(.system(size: 30))
                    }
                    .frame(height: 200)
                    VStack(spacing: 20) {
                        if hidden {
                            Text(correct ? "Correct!" : "Wrong, try again!")
                                .font(.system(size: 30))
                            Button(" Next Round ➡️"){
                                newRound()
                            }
                            .background(.green.gradient)
                            .clipShape(.capsule)
                            .font(.title)
                        }
                    }
                    
                    
                    .frame(height: 250)
                    Spacer()
                    
                }
                .padding()
            }
            
        }
    }
    
    func checkRock(_ roboAnswer: String) {
        switch winOrLose {
        case "Win":
            if (roboAnswer == "✂️") {
                correct = true
                print(correct)
            } else {
                correct = false
                print(correct)
            }
        case "Lose":
            if(roboAnswer == "📄") {
                correct = true
            } else {
                correct = false
            }
        default:
            print("Error")
        }
        hidden = true
        
    }
    
    func checkPaper(_ roboAnswer: String) {
        switch winOrLose {
        case "Win":
            if (roboAnswer == "🪨") {
                correct = true
                print(correct)
            } else {
                correct = false
                print(correct)
            }
        case "Lose":
            if(roboAnswer == "✂️") {
                correct = true
            } else {
                correct = false
            }
        default:
            print("Error")
        }
        hidden = true
        
    }
    
    func checkScissors(_ roboAnswer: String) {
        switch winOrLose {
        case "Win":
            if (roboAnswer == "📄") {
                correct = true
                print(correct)
            } else {
                correct = false
                print(correct)
            }
        case "Lose":
            if(roboAnswer == "🪨") {
                correct = true
            } else {
                correct = false
            }
        default:
            print("Error")
        }
        
        
        hidden = true
        
    }

    
    func newRound() {
        winOrLose = Bool.random() ? "Win" : "Lose"
        gameChoices.shuffle()
        roboAnswer = Int.random(in: 0...2)
        hidden = false
        
    }
}

struct infoGuide: View {
    var body: some View {
        VStack {
            Text("How to play")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                .frame(width: 300, height: 50)
            Text("""
            There are 10 rounds in rock, paper, and scissors with a twist.
            The Robot will select one of the three, and the game will prompt for win or lose
            It is up to the player to select the right option to win the round.
            For example, the Robot selects rock, the game prompts lose, you need to select scissors to lose the round and score a point.
            """)
            Spacer()
            Spacer()
        }
        .padding()
        .background(.blue.gradient)
    }
}

#Preview {
    ContentView()
}
