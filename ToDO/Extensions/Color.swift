//
//  Color.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 29.12.23.
//

import SwiftUI
import Foundation

extension Color{
    
    static let theme = ColorTheme()
    
    func codeAsInt() -> Int16 {
        switch self {
        case .red:
            return 0
        case .orange:
            return 1
        case .yellow:
            return 2
        case .green:
            return 3
        case .cyan:
            return 4
        case .blue:
            return 5
        case .purple:
            return 6
        case .pink:
            return 7
        case .brown:
            return 8
        case .gray:
            return 9
        case .mint:
            return 10
        default:
            return 11
        }
    }
    func decodeAsColor(codedColor : Int16) -> Color {
        switch codedColor {
        case 0:
            return .red
        case 1:
            return .orange
        case 2:
            return .yellow
        case 3:
            return .green
        case 4:
            return .cyan
        case 5:
            return .blue
        case 6:
            return .purple
        case 7:
            return .pink
        case 8:
            return .brown
        case 9:
            return .gray
        case 10:
            return .mint
        default:
            return .red
        }
    }

}
struct ColorTheme {
    
    let background = Color("BackgroundColor")
   
}
