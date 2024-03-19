//
//  EmojiMemoryGameView.swift
//  Memorizer
//
//  Created by Amrit Tiwari on 15/2/2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGameVM
    
    var body: some View {
        VStack{
            
            ScrollView{
                cards
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .imageScale(.large)
        .padding()
    }
    
    private let flexibleColumn = [
        
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100))
    ]
    
    var cards: some View{
        LazyVGrid(columns: flexibleColumn, spacing: 0) {
            ForEach($viewModel.model.cards.indices, id: \.self) { index in
                CardView($viewModel.model.cards[index])
                    .aspectRatio(2/3, contentMode: .fill)
                    .padding(4)
            }
        }
        .foregroundColor(.orange)
    }
}



struct CardView: View {
    
    @Binding var card: MemoryGame<String>.Cards
    
    init(_ card: Binding<MemoryGame<String>.Cards>) {
        self._card = card
    }
    
    var body: some View{
        ZStack(alignment: .center, content: {
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content).font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
            
        }).onTapGesture {
            card.isFaceUp.toggle()
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGameVM())
}
