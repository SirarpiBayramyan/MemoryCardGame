//
//  Card.swift
//  memoryCardGame
//
//  Created by Sirarpi on 9/11/19.
//  Copyright © 2019 Sirarpi. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    static func getUniqueIdentifier() ->Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
