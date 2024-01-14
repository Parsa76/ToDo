//
//  DeveloperPreview.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 27.12.23.
//

import Foundation

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    let item = ItemModel(id: UUID().uuidString, title: "do the dishes", timeToDo: Date(), color: 3, icon: "book.fill", loc: "Kitchen", description: "description", state: 0)
    
    private init() {
        
    }
    
}
