//
//  SettingView.swift
//  ScoreKeeper
//
//  Created by Weerawut Chaiyasomboon on 17/05/2568.
//

import SwiftUI

struct SettingView: View {
    @Binding var doesHighestScoreWin: Bool
    @Binding var startingPoints: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Rules")
                .font(.headline)
            
            Divider()
            
            Picker("Win Condition", selection: $doesHighestScoreWin) {
                Text("Highest Score Wins")
                    .tag(true)
                Text("Lowest Score Wins")
                    .tag(false)
            }
            
            Picker("Starting Points", selection: $startingPoints) {
                Text("0 starting points")
                    .tag(0)
                Text("10 starting points")
                    .tag(10)
                Text("20 starting points")
                    .tag(20)
            }
            
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 10))
    }
}

#Preview {
    @Previewable @State var doesHighestScoreWin = true
    @Previewable @State var startingPoints = 10
    SettingView(doesHighestScoreWin: $doesHighestScoreWin, startingPoints: $startingPoints)
}
