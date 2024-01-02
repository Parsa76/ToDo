//
//  CanbanColumnsHeadBox.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 02.01.24.
//

import SwiftUI

struct CanbanColumnsHeadBox: View {
    
    let width = (UIScreen.main.bounds.width / 3) - 4
    let height = ((UIScreen.main.bounds.width / 3) - 4) * 5/8
    let color: Color
    let title: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(width: width, height: height)
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
        }
    }
}

#Preview {
    CanbanColumnsHeadBox(color: .yellow ,title: "To do")
}
