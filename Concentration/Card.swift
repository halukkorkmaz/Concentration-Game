//
//  Card.swift
//  Concentration
//
//  Created by Abdulhalık Korkmaz on 16.01.2018.
//  Copyright © 2018 Abdulhalık Korkmaz. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init () {
        self.identifier = Card.getUniqueIdentifier()
    }
}
