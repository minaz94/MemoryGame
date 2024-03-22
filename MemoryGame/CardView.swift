//
//  CardView.swift
//  MemoryGame
//
//  Created by Mina on 3/20/24.
//

import SwiftUI

struct CardView: View {
    
    @Binding var card: Card
    @EnvironmentObject var viewModel: GameViewModel
    
    var index: Int
    
    var body: some View {
        ZStack {
            if !card.isFacingUp {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(.mint)
                        .shadow(color: .gray, radius: 3)
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "aqi.medium")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding([.trailing, .bottom])
                        }
                    }
                }
            } else {
                if card.isSolved {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(.white)
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundStyle(.yellow)
                            .opacity(0.4)
                        Image(systemName: card.symbol)
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                }
            }
        }
        .frame(height: 180)
        .rotation3DEffect(.degrees(card.isFacingUp ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        .animation(.default, value: card.isFacingUp)
        .onTapGesture {
            if !card.isSolved && !card.isFacingUp {
                viewModel.cards[index].isFacingUp.toggle()
                viewModel.selectedCards.append(card)
            }
        }
    }
}


#Preview {
    CardView(card: .constant(Card(symbol: "star")), index: 0)
}
