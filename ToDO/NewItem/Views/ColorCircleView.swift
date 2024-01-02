//
//  ColorCircleView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 28.12.23.
//

import SwiftUI

struct ColorCircleView: View {
    var color: Color
    var selected: Bool
    var body: some View {
        ZStack {
            Circle()
                .stroke()
                .frame(width: selected ? 55 : 0 ,height: selected ? 55 : 0)
            Circle()
                .frame(width: 45)
                .foregroundColor(color)
            }
        }
}

#Preview {
    ColorCircleView(color: Color.blue , selected: true)
}
