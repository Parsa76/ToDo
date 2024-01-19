//
//  SymbolSelector.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 19.01.24.
//

import SwiftUI

struct SymbolSelector: View {
    
    @Binding var selectedSymbol: String
    let columns : [GridItem] = [
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem()
    ]
    var symbol: [String] = ["curlybraces.square.fill", "book.fill" , "list.clipboard.fill" , "books.vertical.circle.fill" , "bookmark.fill" , "figure.2.arms.open" ,"pill.fill", "figure.2.and.child.holdinghands" , "figure.run" , "globe.asia.australia.fill", "moon.zzz.fill" , "flame.fill" , "heart.fill" , "video.bubble.fill" , "phone.fill" , "cart.fill" , "basket.fill" , "hammer.fill" ,"dog.fill","cat.fill" ,"shower.handheld.fill", "popcorn.fill" , "airplane", "guitars.fill" , "bolt.car.fill"]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(symbol.indices) { icon in
                SymbolView(symbol: symbol[icon], selected: selectedSymbol == symbol[icon])
                    .onTapGesture {
                        selectedSymbol = symbol[icon]
                    }
            }
        }
    }
}

#Preview {
    SymbolSelector(selectedSymbol: .constant("book.fill"))
}
