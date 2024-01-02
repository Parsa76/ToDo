//
//  Date.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 01.01.24.
//

import Foundation

extension Date {
    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        return formatter
    }
    
    func asShortDateString() -> String {
        return shortFormatter.string(from: self)
    }
}
