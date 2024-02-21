//
//  ContentView.swift
//  Memorizer
//
//  Created by Amrit Tiwari on 15/2/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojis = ["👻", "👺", "👨🏼‍🏫", "👳🏻‍♀️", "💂🏼‍♂️", "👴", "👲", "👻", "👺", "👨🏼‍🏫"]
    
    @State var cardCount : Int = 4
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjuster
            
        }.onAppear {
            emojis.append("👩🏻‍🌾")
        }
        
        .imageScale(.large)
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
                    .aspectRatio(2/3, contentMode: .fill)
            }
        }
        .foregroundColor(.orange)
        
    }
    
    var cardCountAdjuster: some View{
        
        HStack(alignment: .center){
            cardAdder
            Spacer()
            cardRemover
        }
        .imageScale(.large)
        .font(.title)
        .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
    }
    
    func cardCalculator(by offSet: Int, symbol: String) -> some View{
        Button{
            cardCount += offSet
        }label: {
            Image(systemName: symbol)
        }
        .disabled(cardCount + offSet < 1 || cardCount + offSet > emojis.count)
    }
    
    var cardAdder: some View{
        cardCalculator(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cardRemover: some View{
        cardCalculator(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
}




struct CardView: View {
    
    let content: String
    @State var isFaceUp = false
    
    var body: some View{
        ZStack(alignment: .center, content: {
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }).onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
