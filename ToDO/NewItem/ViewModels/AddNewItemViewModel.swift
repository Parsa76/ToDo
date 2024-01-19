//
//  AddNewItemViewModel.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 28.12.23.
//

import Foundation
import SwiftUI
import Combine

class AddNewItemViewModel :ObservableObject {
    
    let dataService:ItemDataService
    let notificationManager: NotificationManager
    
    private var cancellables = Set<AnyCancellable>()
    
    init(dependencies: Dependencies) {
        self.dataService = dependencies.itemDataSevice
        self.notificationManager = dependencies.notificationManager
    }
    func saveToCoreData(id: String ,title: String, timeToDo: Date, color: Int16, icon: String, loc: String, description: String, state: Int16 , notification: Bool) {
        
        let item: ItemModel = ItemModel(id: id, title: title, timeToDo: timeToDo, color: color, icon: icon, loc: loc, description: description, state: state)
        dataService.addNewItem(item: item)
        if notification {
            notificationManager.scheduleNotification(title: title, subtitle: description, id: id, date: timeToDo)
        }
    }
  
}
