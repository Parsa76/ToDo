//
//  DetailsViewModel.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 31.12.23.
//

import Foundation

class DetailsViewModel:ObservableObject {
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    func markasDone(item: ItemModel) {
        dependencies.itemDataSevice.updateItem(item: item, title: item.title, color: item.color, icon: item.icon, date: item.timeToDo, description: item.description, loc: item.loc, state: 2)
    }
    func markasToDo(item: ItemModel) {
        dependencies.itemDataSevice.updateItem(item: item, title: item.title, color: item.color, icon: item.icon, date: item.timeToDo, description: item.description, loc: item.loc, state: 0)
    }
    func markasDoing(item: ItemModel) {
        dependencies.itemDataSevice.updateItem(item: item, title: item.title, color: item.color, icon: item.icon, date: item.timeToDo, description: item.description, loc: item.loc, state: 1)
    }
}
