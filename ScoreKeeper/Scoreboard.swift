//
//  Scoreboard.swift
//  ScoreKeeper
//
//  Created by Weerawut Chaiyasomboon on 16/05/2568.
//

import Foundation

struct Scoreboard {
    var players: [Player] = [
        Player(name: "Elisha", score: 0),
        Player(name: "Andre", score: 0),
        Player(name: "Jasmine", score: 0)
    ]
    
    var state: GameState = .setup
    var doesHighestScoreWin = true
    
    var winners: [Player] {
        guard state == .gameOver else { return [] }
        
        var winningScores = 0
        if doesHighestScoreWin {
            winningScores = Int.min
            for player in players {
                winningScores = max(player.score,winningScores)
            }
        } else {
            winningScores = Int.max
            for player in players {
                winningScores = min(player.score,winningScores)
            }
        }
        
        return players.filter({$0.score == winningScores})
    }
    
    mutating func resetScores(to newValue: Int) {
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}
