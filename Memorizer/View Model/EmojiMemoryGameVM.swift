//
//  EmojiMemoryGameVM.swift
//  Memorizer
//
//  Created by Amrit Tiwari on 3/3/2024.
//

import SwiftUI

class EmojiMemoryGameVM: ObservableObject{
    
    private static let emojis = ["👻", "👺", "👨🏼‍🏫", "👳🏻‍♀️", "💂🏼‍♂️", "👴", "👲", "👻", "👺", "👨🏼‍🏫","👩🏻‍🌾"]
    
    private static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame(numberOfPairsCards: 20){
            if emojis.indices.contains($0){
                return emojis[$0]
            }else{
                return "⁇"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Cards>{
        return model.cards
    }
    
    // MARK: Intent
    func shuffle(){
        model.shuffle()
    }
    func choose(_ card: MemoryGame<String>.Cards){
        model.choose(card)
    }
}
