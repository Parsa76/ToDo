//
//  Int16.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 30.12.23.
//

import SwiftUI

extension Int16 {
    func decodeAsColor() -> Color {
        switch self {
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
