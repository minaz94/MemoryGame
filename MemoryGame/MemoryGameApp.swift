//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by Mina on 3/20/24.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    
    @StateObject var viewModel = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(viewModel)
        }
    }
}
