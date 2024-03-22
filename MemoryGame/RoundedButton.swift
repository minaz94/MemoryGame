//
//  RoundedButton.swift
//  MemoryGame
//
//  Created by Mina on 3/20/24.
//

import SwiftUI

struct RoundedButton: View {
    
    var title: String
    var backgroundColor: Color
    var action: () -> ()
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .foregroundStyle(.white)
        })
        .frame(width: 120, height: 50)
        .background(backgroundColor)
        .clipShape(Capsule())
        .shadow(color: .gray, radius: 3)
    }
}

#Preview {
    RoundedButton(title: "choose size", backgroundColor: .orange) {
        
    }
}
