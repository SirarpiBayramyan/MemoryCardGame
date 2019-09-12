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
        for _ in 1...numberOfPairsOfcards {
            let card = Card()
            cards += [card, card]
        }
        //shuffleCards()
        cards.shuffle()
    }
    
    var indexOfOneAndOnluFaceUpCard: Int?
    
    func cooseCard(at index: Int) {
        
        if !cards[index].isMatched {
    
            if let matchedIndex = indexOfOneAndOnluFaceUpCard, matchedIndex != index {
                
                if cards[matchedIndex].identifier == cards[index].identifier {

                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
               
                cards[index].isFaceUp = true
                indexOfOneAndOnluFaceUpCard = nil
               
                
               
                
            } else {
                
                    for flipDownIndex in cards.indices {
                        cards[flipDownIndex].isFaceUp = false
                    }
                    cards[index].isFaceUp = true
                    indexOfOneAndOnluFaceUpCard = index
                 }
            
           }
        
    }
    
    //Shuffle the cards
//    func shuffleCards (){
//        for _ in 1...cards.count {
//            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
//            cards.swapAt(0, randomIndex)
//        }
//    }
}
