//
//  GameView.swift
//  MemoryGame
//
//  Created by Mina on 3/20/24.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var viewModel: GameViewModel

    var body: some View {
        
        HeaderView()
        ScrollView {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], content: {
                
                ForEach(Array(viewModel.cards.enumerated()), id: \.offset) { index, card in
                    CardView(card: .constant(card), index: index)
                }
            })
            .padding()
        }
        .onAppear {
            viewModel.startGame(cardCount: .six)
        }
    }
}

#Preview {
    GameView()
        .environmentObject(GameViewModel())
}
