//
//  SymbolView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 28.12.23.
//

import SwiftUI

struct SymbolView: View {
    let symbol: String
    var selected: Bool
    var body: some View {
        ZStack {
            Circle()
                .stroke()
                .frame(width: selected ? 55 : 0 ,height: selected ? 55 : 0)
            Circle()
                .foregroundColor(.secondary.opacity(0.5))
                .frame(width: 45 , height: 45)
        
            Image(systemName: symbol)
                .resizable()
                .scaledToFit()
                .frame(width: 25 , height: 25)
                .foregroundColor(.primary)
        }
        .frame(width: 55, height: 55)
    }
}

#Preview {
    SymbolView(symbol: "book.fill" ,selected: true)
}
