//
//  ItemModel.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 27.12.23.
//

import Foundation
import CoreTransferable


struct ItemModel: Identifiable ,Codable,  Equatable , Transferable{
    let id: String
    let title: String
    let timeToDo: Date
    let color: Int16
    let icon: String
    let loc: String
    let description: String
    let state: Int16
    
    init(id: String, title: String, timeToDo: Date, color: Int16, icon: String, loc: String, description: String, state: Int16) {
        self.id = id
        self.title = title
        self.timeToDo = timeToDo
        self.color = color
        self.icon = icon
        self.loc = loc
        self.description = description
        self.state = state
    }
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .itemModel)
    }
 
   
   
}
