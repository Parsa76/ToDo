//
//  ColorSelector.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 19.01.24.
//

import SwiftUI

struct ColorSelector: View {
    
    @Binding var selectedColor: Color
    let colors: [Color] = [.red,.orange,.yellow,.green ,.cyan , .blue , .purple, .pink , .brown , .gray , .mint]
    let columns : [GridItem] = [
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem()
    ]
    
    var body: some View {
        LazyVGrid(columns: columns){
            ForEach(colors.indices) { index in
                ColorCircleView(color: colors[index], selected: selectedColor == colors[index])
                    .onTapGesture {
                        selectedColor = colors[index]
                    }
            }
        }
    }
}

#Preview {
    ColorSelector(selectedColor: .constant(.red))
    
}
