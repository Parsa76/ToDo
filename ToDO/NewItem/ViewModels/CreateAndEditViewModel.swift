//
//  EditItemViewModel.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 07.01.24.
//

import Foundation
import SwiftUI

class CreateAndEditViewModel: ObservableObject {
    
    let dataService: ItemDataService
    let notificationManager: NotificationManager
    let hapticManager: HapticManager
    
    init(dependencies: Dependencies) {
        self.dataService = dependencies.itemDataSevice
        self.notificationManager = dependencies.notificationManager
        self.hapticManager = dependencies.hapticManager
    }
   
    func updateItem(item: ItemModel , title: String ,loc: String , description: String , selectedDate:Date , color:Int16 , icon:String , remeinder: Bool) {
            notificationManager.cancelNotification(id: item.id)
            dataService.updateItem(item: item, title: title, color: color, icon: icon, date: selectedDate, description: description, loc: loc, state: item.state)
            hapticManager.notification(type: .success)
            if remeinder {
                notificationManager.scheduleNotification(title: title, subtitle: description, id: item.id, date: selectedDate)
            }
    }
    func CreateAndSave(id: String ,title: String, timeToDo: Date, color: Int16, icon: String, loc: String, description: String, state: Int16 , notification: Bool) {
        
        let item: ItemModel = ItemModel(id: id, title: title, timeToDo: timeToDo, color: color, icon: icon, loc: loc, description: description, state: state)
        dataService.addNewItem(item: item)
        hapticManager.notification(type: .success)
        if notification {
            notificationManager.scheduleNotification(title: title, subtitle: description, id: id, date: timeToDo)
        }
    }
}
