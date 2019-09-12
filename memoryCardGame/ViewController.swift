//
//  ViewController.swift
//  memoryCardGame
//
//  Created by Sirarpi on 9/11/19.
//  Copyright © 2019 Sirarpi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy  var game = MemoryCardGame(numberOfPairsOfcards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flip: \(flipCount)"
        }
    }
    
    var emojiCoices = ["🍌","🥥","🍊","🍓","🍇","🍒","🍐","🥝","🍏","🍍"]
    
    var emoji = [Int:String]()
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
  
    @IBAction func touchButton(_ sender: UIButton) {
        flipCount += 1 //
         //sender.isEnabled = false
      if  let cardNumber = cardButtons.firstIndex(of: sender)
      {
        game.cooseCard(at: cardNumber)
      
        updateViewFromModel()
         //sender.isEnabled = false
      }
        sender.isEnabled = false
        
        
        if flipCount > 30 {
           flipCountLabel.text = " Game Over "
            for button in cardButtons {

                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.7530761361, green: 1, blue: 0.9949988723, alpha: 1)
               // button.isEnabled = false
            }

      }
    }
   
    func updateViewFromModel(){
        for index in cardButtons.indices {
            
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiChoice(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.9569379687, green: 0.8365390897, blue: 0.979655683, alpha: 1)
                button.isEnabled = false
                
            }else {
                
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0): #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
                button.isEnabled = true
            }
            
        }
    }
    
    
    func emojiChoice(for card : Card) -> String {
        if emoji[card.identifier] == nil, emojiCoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCoices.count)))
            emoji[card.identifier] = emojiCoices.remove(at: randomIndex)
            
        }
        return emoji[card.identifier] ?? "?"
    }
   
    
    @IBAction func touchNewGame(_ sender: UIButton) {
    
        flipCount = 0
        game.cards.removeAll()
        //emoji.removeAll()
        game = MemoryCardGame(numberOfPairsOfcards: (cardButtons.count + 1 ) / 2) //new game
        updateViewFromModel() //update from Model
    }
}

