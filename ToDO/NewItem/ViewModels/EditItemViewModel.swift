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
    var symbol: [String] = ["curlybraces.square.fill", "book.fill" , "list.clipboard.fill" , "books.vertical.circle.fill" , "bookmark.fill" , "figure.2.arms.open" ,"pill.fill", "figure.2.and.child.holdinghands" , "figure.run" , "globe.asia.australia.fill", "moon.zzz.fill" , "flame.fill" , "heart.fill" , "video.bubble.fill" , "phone.fill" , "cart.fill" , "basket.fill" , "hammer.fill" ,"dog.fill","cat.fill" ,"shower.handheld.fill", "popcorn.fill" , "airplane", "guitars.fill" , "bolt.car.fill"]
    
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
