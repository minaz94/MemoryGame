//
//  HeaderView.swift
//  MemoryGame
//
//  Created by Mina on 3/20/24.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        HStack {
            Menu("Choose size") {
                ForEach(CardCount.allCases, id: \.rawValue) { count in
                    Button("\(count.rawValue) Cards") {
                        viewModel.startGame(cardCount: count)
                    }
                }
            }
            .frame(width: 120, height: 50)
            .background(.orange)
            .clipShape(Capsule())
            .foregroundStyle(.white)
            .shadow(color: .gray, radius: 3)
            
            Spacer()
            
            RoundedButton(title: "Reset", backgroundColor: .green) {
                viewModel.startGame(cardCount: viewModel.cardCount)
            }
        }
        .padding(.all)
    }
}

#Preview {
    HeaderView()
}
