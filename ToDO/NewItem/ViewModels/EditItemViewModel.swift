//
//  EditItemViewModel.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 07.01.24.
//

import Foundation
import SwiftUI

class EditItemViewModel: ObservableObject {
    
    let dataService: ItemDataService
    let notificationManager: NotificationManager
    let hapticManager: HapticManager
    
    init(dependencies: Dependencies) {
        self.dataService = dependencies.itemDataSevice
        self.notificationManager = dependencies.notificationManager
        self.hapticManager = dependencies.hapticManager
    }
    var colors: [Color] = [.red,.orange,.yellow,.green ,.cyan , .blue , .purple, .pink , .brown , .gray , .mint]
   
    func updateItem(item: ItemModel? , title: String ,loc: String , description: String , selectedDate:Date , color:Int16 , icon:String , remeinder: Bool) {
        if let item = item {
            notificationManager.cancelNotification(id: item.id)
            dataService.updateItem(item: item, title: title, color: color, icon: icon, date: selectedDate, description: description, loc: loc, state: item.state)
            if remeinder {
                notificationManager.scheduleNotification(title: title, subtitle: description, id: item.id, date: selectedDate)
            }
        } else {
            return
        }
    }
}
