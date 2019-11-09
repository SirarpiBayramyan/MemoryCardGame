//
//  Concentration.swift
//  Concentration
//
//  Created by Sirarpi on 10/26/19.
//  Copyright © 2019 Sirarpi. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var cards = [Card]()
    private(set) var flipCount = 0
    var score = 0
    private var seenCards: Set<Int> = []
    
    
    private struct Points {
        static let matchBonus = 2
        static let missMatchPenalty = 1
    }
     private(set) var indexOfOneAndOnlyFaceUpCard: Int?  {
            get {
                var foundIndex: Int?
                for index in cards.indices {
                    if cards[index].isFaceUp  {
                        guard foundIndex == nil else { return nil }
                        foundIndex = index
                    }
                }
                return foundIndex
            }
            set {
                for index in cards.indices {
                    cards[index].isFaceUp = (index == newValue)
                }
            }
                    
        }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)) : Choosen index out of range")
        if !cards[index].isMatched {
            flipCount += 1
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {

                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    
                    score += Points.matchBonus
                } else {
                    if seenCards.contains(index) {
                        score -= Points.missMatchPenalty
                    }
                    if seenCards.contains(matchIndex) {
                        score -= Points.missMatchPenalty
                    }
                    seenCards.insert(index)
                    seenCards.insert(matchIndex)
                }
                cards[index].isFaceUp = true
                
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
           // User.sharedUser.score = "Score: \(game.score)"
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    func resetGame() {
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        cards.shuffle()
    }
}
