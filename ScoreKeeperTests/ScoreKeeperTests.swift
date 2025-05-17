//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by Weerawut Chaiyasomboon on 16/05/2568.
//

import Testing
@testable import ScoreKeeper

struct ScoreKeeperTests {

    @Test("Reset player scores", arguments: [0,10,20])
    func resetScores(to newValue: Int) async throws {
        var scoreboard = Scoreboard(players: [
            Player(name: "Elisha", score: 0),
            Player(name: "Andre", score: 5)
        ])
        
        scoreboard.resetScores(to: newValue)
        
        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }
    
    @Test("Highest Score Wins")
    func highestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0),
                Player(name: "Andre", score: 4)
            ],
            state: .gameOver,
            doesHighestScoreWin: true
        )
        
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Andre", score: 4)])
    }

    @Test("Lowest Score Wins")
    func lowestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0),
                Player(name: "Andre", score: 4)
            ],
            state: .gameOver,
            doesHighestScoreWin: false
        )
        
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Elisha", score: 0)])
    }
    
    @Test("Many Players Highest Score Wins")
    func manyPlayersHighestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0),
                Player(name: "Andre", score: 4),
                Player(name: "Jim", score: 4)
            ],
            state: .gameOver,
            doesHighestScoreWin: true
        )
        
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Andre", score: 4),Player(name: "Jim", score: 4)])
    }
    
    @Test("Many Players Lowest Score Wins")
    func manyPlayersLowestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 2),
                Player(name: "Andre", score: 2),
                Player(name: "Jim", score: 4)
            ],
            state: .gameOver,
            doesHighestScoreWin: false
        )
        
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Elisha", score: 2),Player(name: "Andre", score: 2)])
    }
}
