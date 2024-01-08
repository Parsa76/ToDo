//
//  IconView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 28.12.23.
//

import SwiftUI

struct IconView: View {
    var color: Color
    var symbol: String
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
            Image(systemName: symbol)
                .resizable()
                .scaledToFit()
                .frame(width: 30 , height: 30)
                .foregroundColor(.white)
        }
        .frame(width: 55, height: 55)
    }
}

#Preview {
    IconView(color: .red,symbol: "curlybraces.square.fill")
}
