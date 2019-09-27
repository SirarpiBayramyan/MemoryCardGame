//
//  MemoryCardGame.swift
//  memoryCardGame
//
//  Created by Sirarpi on 9/11/19.
//  Copyright © 2019 Sirarpi. All rights reserved.
//

import Foundation

class MemoryCardGame {
    
    var cards = [Card]()
    
    init(numberOfPairsOfcards: Int){
        assert(numberOfPairsOfcards > 0, "Concentration.init \(numberOfPairsOfcards) : you nust have at least one pair cards ")
        for _ in 1...numberOfPairsOfcards {
            let card = Card()
            cards += [card, card]
        }
        //shuffleCards()
        cards.shuffle()
    }
    
    var indexOfOneAndOnluFaceUpCard: Int? {
        get{
            
            return cards.indices.filter {
                cards[$0].isFaceUp
                }.oneAndOnly
        }
        set{
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
  
    func cooseCard(at index: Int) {
        
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index): chosen index not the cards")
        
        if !cards[index].isMatched {
            
            if let matchedIndex = indexOfOneAndOnluFaceUpCard, matchedIndex != index {
                
                if cards[matchedIndex] == cards[index] {
                    
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                    
                }
                
                cards[index].isFaceUp = true
                
            } else {
                
                indexOfOneAndOnluFaceUpCard = index
                
            }
            
        }
        
    }
    
}
extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first :nil
    }
}



