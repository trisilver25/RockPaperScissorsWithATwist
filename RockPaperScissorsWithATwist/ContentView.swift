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
    
    @State private var hiddenInfo = false
    @State private var showScoreCard = false
    
    @State private var round = 0
    @State private var score = 0
    
    @State private var animationAmount = 0.0
    
    
    
    
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(colors: [.white, .blue], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    VStack(spacing: 10) {
                        Text("🤖")
                            .font(.system(size: 100))
                        Text("Beep boop, I'll use: \(gameChoices[roboAnswer])")
                            .font(.system(size: 30))
                        Text("You need to: \(winOrLose)")
                            .font(.system(size: 30))
                    }
                    Spacer()
                    VStack (spacing: 30) {
                        Button {
                            checkRock(gameChoices[roboAnswer])
                        } label: {
                            Text(" Rock 🪨 ")
                                .foregroundStyle(.black)
                        }
                        .padding(3)
                        .background(.white.gradient)
                        .clipShape(.capsule)
                        .font(.system(size: 30))
                        .disabled(hiddenInfo ? true : false)
                        
                        Button {
                            checkPaper(gameChoices[roboAnswer])
                        } label: {
                            Text(" Paper 📄 ")
                                .foregroundStyle(.black)
                        }
                        .padding(3)
                        .background(.white.gradient)
                        .clipShape(.capsule)
                        .font(.system(size: 30))
                        .disabled(hiddenInfo ? true : false)
                        
                        Button {
                            checkScissors(gameChoices[roboAnswer])
                        } label: {
                            Text(" Scissors ✂️ ")
                                .foregroundStyle(.black)
                        }
                        .padding(3)
                        .background(.white.gradient)
                        .clipShape(.capsule)
                        .font(.system(size: 30))
                        .disabled(hiddenInfo ? true : false)
                        
                        HStack {
                            Spacer()
                            Text("Round \(round)")
                                .font(.system(size: 25))
                            Spacer()
                            Text("Score \(score)")
                                .font(.system(size: 25))
                            Spacer()
                        }
                        
                        Spacer()
                        
                        if hiddenInfo && round == 10 {
                            
                            Text(correct ? "Correct!" : "Wrong, try again!")
                                .font(.system(size: 25))
                            
                            Button("End Game"){
                                showScoreCard.toggle()
                                withAnimation(.spring(duration: 1, bounce: 0.5)){
                                    animationAmount += 360
                                }
                                
                            }
                                .padding(10)
                                .background(.white.gradient)
                                .clipShape(.capsule)
                                .foregroundStyle(.black)
                                .font(.title2)
                                .disabled(showScoreCard ? true : false)
                            
                        } else if hiddenInfo {
                            
                            Text(correct ? "Correct!" : "Wrong, try again!")
                                .font(.system(size: 25))
                            
                            Button("Next Round"){
                                newRound()
                            }
                            .padding(10)
                            .background(.white.gradient)
                            .clipShape(.capsule)
                            .foregroundStyle(.black)
                            .font(.title2)

                        }
                    }
                }
                
                .toolbar {
                    NavigationLink(destination: infoGuide()) {
                        Image(systemName: "info.circle")
                            .foregroundStyle(.black)
                    }
                    .disabled(hiddenInfo ? true : false)
                }
                
                if showScoreCard {
                    ZStack {
                        RoundedRectangle(cornerRadius: 3)
                            .fill(.blue.gradient)
                            .frame(width: 250, height: 300)
                            .rotation3DEffect(Angle(degrees: animationAmount), axis: (x: 0, y: 1, z: 0))
                        
                        VStack(spacing: 5) {
                            Text("Results")
                                .foregroundStyle(.white)
                                .font(.title)
                            .rotation3DEffect(Angle(degrees: animationAmount), axis: (x: 0, y: 1, z: 0))
                            
                            Text("Your total score is \(score) out of 10")
                                .foregroundStyle(.white)
                                .font(.title3)
                                .rotation3DEffect(Angle(degrees: animationAmount), axis: (x: 0, y: 1, z: 0))
                            Button("Restart") {
                                restartGame()
                            }
                            .padding(10)
                            .background(.white.gradient)
                            .clipShape(.capsule)
                            .foregroundStyle(.black)
                            .font(.title2)
                            .rotation3DEffect(Angle(degrees: animationAmount), axis: (x: 0, y: 1, z: 0))
                        }
                    }
                        
                }
            }
            
        }
    }
    
    func checkRock(_ roboAnswer: String) {
        switch winOrLose {
        case "Win":
            if (roboAnswer == "✂️") {
                correct = true
            } else {
                correct = false
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
        
        if correct {
            score += 1
        }
        
        hiddenInfo = true
        round += 1
        
    }
    
    func checkPaper(_ roboAnswer: String) {
        switch winOrLose {
        case "Win":
            if (roboAnswer == "🪨") {
                correct = true
            } else {
                correct = false
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
        
        if correct {
            score += 1
        }
        
        hiddenInfo = true
        round += 1
    }
    
    func checkScissors(_ roboAnswer: String) {
        switch winOrLose {
        case "Win":
            if (roboAnswer == "📄") {
                correct = true
            } else {
                correct = false
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
        
        if correct {
            score += 1
        }
        
        hiddenInfo = true
        round += 1
        
    }

    
    func newRound() {
        winOrLose =  winOrLose == "Win" ? "Lose" : "Win"
        gameChoices.shuffle()
        roboAnswer = Int.random(in: 0...2)
        hiddenInfo = false
        
    }
    
    func restartGame() {
        round = 0
        score = 0
        gameChoices.shuffle()
        roboAnswer = Int.random(in: 0...2)
        winOrLose =  winOrLose == "Win" ? "Lose" : "Win"
        hiddenInfo = false
        showScoreCard = false
        
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
        .background(LinearGradient(colors: [.white, .blue], startPoint: .top, endPoint: .bottom))
    }
}


#Preview {
    ContentView()
}
