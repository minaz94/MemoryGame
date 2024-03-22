//
//  GameViewModel.swift
//  MemoryGame
//
//  Created by Mina on 3/20/24.
//

import Foundation

@MainActor
class GameViewModel: ObservableObject {
    
    @Published var cards: [Card] = []
    var cardCount: CardCount = .six
    
    var selectedCards: [Card] = [] {
        didSet {
            
            if selectedCards.count == 2 {
                if selectedCards[0].symbol == selectedCards[1].symbol {
                    for i in 0..<cards.count {
                        if cards[i].symbol == selectedCards[0].symbol {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.cards[i].isSolved = true
                            }
                        }
                    }
                    selectedCards.removeAll()
                    
                } else {
                    for i in 0..<cards.count {
                        if cards[i].symbol == selectedCards[0].symbol || cards[i].symbol == selectedCards[1].symbol {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.cards[i].isFacingUp = false
                            }
                        }
                    }
                    self.selectedCards.removeAll()
                }
            }
        }
    }
    
    private var availableCards: [Card] = [
        Card(symbol: "cat"),
        Card(symbol: "dog"),
        Card(symbol: "star"),
        Card(symbol: "heart"),
        Card(symbol: "book"),
        Card(symbol: "sun.max"),
        Card(symbol: "cloud"),
        Card(symbol: "popcorn"),
        Card(symbol: "balloon.2")
    ]
    
    func startGame(cardCount: CardCount) {
        self.cardCount = cardCount
        cards.removeAll()
        var tempCards: [Card] = []
        
        for i in 0...(cardCount.rawValue / 2) - 1 {
            let card1 = Card(symbol: availableCards[i].symbol)
            let card2 = Card(symbol: availableCards[i].symbol)
            
            tempCards.append(card1)
            tempCards.append(card2)
        }
        cards = tempCards.shuffled()
    }
}

enum CardCount: Int, CaseIterable {
    case six = 6
    case twelve = 12
    case eighteen = 18
}

