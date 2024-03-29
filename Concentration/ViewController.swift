//
//  ViewController.swift
//  Concentration
//
//  Created by Abdulhalık Korkmaz on 15.01.2018.
//  Copyright © 2018 Abdulhalık Korkmaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    lazy var game = Concentration(numberofPairsOfCard: numberOfPairsOfCard)
    
    var numberOfPairsOfCard: Int {
        return ((cardButtons.count+1)/2)
    }
    
    //Every time this variable change, this func (didSet)automatically run
    var flipCount = 0 { didSet { flipCountLabel.text = "Flips: \(flipCount)" } }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emojiChoices = ["👩🏻‍✈️","👩🏻‍🎨","🕵🏻","👨🏻‍💻","👨🏼‍🔬","👨🏻‍🚒","👨🏻‍🎤","👩🏻‍🏫","👩🏻‍🍳"]
    
    private var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 { // If the identifier is equal to nill And if choice count greater than zero.
                emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random) // remove the selected emoji
            }

        /*if emoji[card.identifier] != nil {
            return emoji[card.identifier]!
        } else {
            return "?"
        }*/ //this means same as the next return definition.
        return emoji[card.identifier] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}























