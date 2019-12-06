//
//  Concentration.swift
//  Concentration
//
//  Created by Abdulhalık Korkmaz on 16.01.2018.
//  Copyright © 2018 Abdulhalık Korkmaz. All rights reserved.
//

import Foundation

struct Concentration
{
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFacedUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
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
    
    //Game Logic
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFacedUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                //indexOfOneAndOnlyFacedUpCard = nil
            } else {/*
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true*/
                indexOfOneAndOnlyFacedUpCard = index
            }
        }
    }
    
    init(numberofPairsOfCard: Int) {
        assert(numberofPairsOfCard > 0, "Concentration.chooseCard(at: \(numberofPairsOfCard)): you must have at least one pair of cards")
        for _ in 1...numberofPairsOfCard {
            let card = Card()
            cards += [card, card]
        }
        //TODO: Shuffle the cards
        
    }
}
