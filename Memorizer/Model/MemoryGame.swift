//
//  MemorizerGame.swift
//  Memorizer
//
//  Created by Amrit Tiwari on 28/2/2024.
//

import Foundation

struct MemoryGame<CardContent>{
    var cards: Array<Cards>
    
    init(numberOfPairsCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        
        for index in 0..<max(2,numberOfPairsCards){
            let content = cardContentFactory(index)
            cards.append(Cards(content: content))
//            cards.append(Cards(content: content))
        }
    }
    
    func choose(_ card: Cards){
        
    }

    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Cards{
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
