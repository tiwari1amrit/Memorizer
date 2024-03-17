//
//  MemorizerApp.swift
//  Memorizer
//
//  Created by Amrit Tiwari on 15/2/2024.
//

import SwiftUI

@main
struct MemorizerApp: App {
    
    @StateObject var game = EmojiMemoryGameVM()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
