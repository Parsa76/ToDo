//
//  IconRowView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 31.12.23.
//

import SwiftUI

struct IconRowView: View {
    var color: Color
    var symbol: String
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
            Image(systemName: symbol)
                .resizable()
                .scaledToFit()
                .frame(width: 20 , height: 20)
                .foregroundColor(.white)
                
                
        }
        .frame(width: 37, height: 37)
    }
}

#Preview {
    IconRowView(color: .red,symbol: "curlybraces.square.fill")
}
