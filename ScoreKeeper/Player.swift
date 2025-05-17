//
//  Player.swift
//  ScoreKeeper
//
//  Created by Weerawut Chaiyasomboon on 16/05/2568.
//

import Foundation
import SwiftUI

struct Player: Identifiable {
    let id = UUID()
    var name: String
    var score: Int
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score
    }
}
