//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Weerawut Chaiyasomboon on 16/05/2568.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreboard = Scoreboard()
    @State private var startingPoints = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            SettingView(doesHighestScoreWin: $scoreboard.doesHighestScoreWin, startingPoints: $startingPoints)
                .disabled(scoreboard.state != .setup)
            
            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    
                    Text("Scores")
                        .opacity(scoreboard.state == .setup ? 0 : 1)
                }
                .font(.headline)
                
                ForEach($scoreboard.players) { $player in
                    GridRow {
                        HStack {
                            if scoreboard.winners.contains(player) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(.yellow)
                            }
                            
                            TextField("Name", text: $player.name)
                                .disabled(scoreboard.state != .setup)
                        }

                        Text("\(player.score)")
                            .opacity(scoreboard.state == .setup ? 0 : 1)
                        Stepper("", value: $player.score, in: 0...20)
                            .labelsHidden()
                            .opacity(scoreboard.state == .setup ? 0 : 1)
                        
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Players", systemImage: "plus") {
                scoreboard.players.append(.init(name: "", score: 0))
            }
            .opacity(scoreboard.state == .setup ? 1 : 0)
            
            Spacer()
            
            HStack {
                switch scoreboard.state {
                case .setup:
                    Button("Start Game", systemImage: "play.fill") {
                        scoreboard.state = .playing
                        scoreboard.resetScores(to: startingPoints)
                    }
                case .playing:
                    Button("End Game", systemImage: "stop.fill") {
                        scoreboard.state = .gameOver
                    }
                case .gameOver:
                    Button("Reset Game", systemImage: "arrow.counterclockwise") {
                        scoreboard.state = .setup
                    }
                }
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .tint(.blue)
            .frame(maxWidth: .infinity)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
