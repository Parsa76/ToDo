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
    
    var colors: [Color] = [.red,.orange,.yellow,.green ,.cyan , .blue , .purple, .pink , .brown , .gray , .mint]
    var symbol: [String] = ["curlybraces.square.fill", "book.fill" , "list.clipboard.fill" , "books.vertical.circle.fill" , "bookmark.fill" , "figure.2.arms.open" ,"pill.fill", "figure.2.and.child.holdinghands" , "figure.run" , "globe.asia.australia.fill", "moon.zzz.fill" , "flame.fill" , "heart.fill" , "video.bubble.fill" , "phone.fill" , "cart.fill" , "basket.fill" , "hammer.fill" ,"dog.fill","cat.fill" ,"shower.handheld.fill", "popcorn.fill" , "airplane", "guitars.fill" , "bolt.car.fill"]
    
    func saveToCoreData(id: String ,title: String, timeToDo: Date, color: Int16, icon: String, loc: String, description: String, state: Int16 , notification: Bool) {
        
        let item: ItemModel = ItemModel(id: id, title: title, timeToDo: timeToDo, color: color, icon: icon, loc: loc, description: description, state: state)
        dataService.addNewItem(item: item)
        if notification {
            notificationManager.scheduleNotification(title: title, subtitle: description, id: id, date: timeToDo)
        }
    }
  
}
