//
//  Card.swift
//  Concentration
//
//  Created by Sirarpi on 10/26/19.
//  Copyright © 2019 Sirarpi. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierfactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierfactory += 1
        return identifierfactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
