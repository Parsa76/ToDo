//
//  HomeViewModel.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 27.12.23.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject {
    
    @Published var toDoItems: [ItemModel] = []
    @Published var doingItems: [ItemModel] = []
    @Published var doneITems: [ItemModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    let itemsDataService: ItemDataService
    let notificationManager: NotificationManager
    init(dependencies: Dependencies) {
        self.itemsDataService = dependencies.itemDataSevice
        self.notificationManager = dependencies.notificationManager
        addSubscribers()
    }
    private func addSubscribers() {
        $toDoItems
            .combineLatest(itemsDataService.$savedEntities)
            .map(mapToDoItems)
            .sink { [weak self] (returnedItems) in
                guard let self = self else {return}
                self.toDoItems = returnedItems
            }
            .store(in: &cancellables)
        $doneITems
            .combineLatest(itemsDataService.$savedEntities)
            .map(mapDoneItems)
            .sink { [weak self] (returnedItems) in
                guard let self = self else {return}
                self.doneITems = returnedItems
            }
            .store(in: &cancellables)
        $doingItems
            .combineLatest(itemsDataService.$savedEntities)
            .map(mapDoingItems)
            .sink{[weak self] (returnedItems) in
                guard let self = self else {return}
                self.doingItems = returnedItems
            }
            .store(in: &cancellables)
    }
    private func mapDoingItems(allItems: [ItemModel] ,itemEntities:[ItemEntity]) ->[ItemModel]{
       itemEntities
            .map { item in
                itemsDataService.convert(entity: item)
            }
            .sorted(by: {$0.timeToDo < $1.timeToDo})
            .filter{($0.state == 1)}
    }
    
    private func mapToDoItems(allItems: [ItemModel] ,itemEntities:[ItemEntity]) ->[ItemModel]{
       itemEntities
            .map { item in
                itemsDataService.convert(entity: item)
            }
            .sorted(by: {$0.timeToDo < $1.timeToDo})
            .filter{($0.state == 0)}
    }
    private func mapDoneItems(allItems: [ItemModel] ,itemEntities:[ItemEntity]) ->[ItemModel]{
       itemEntities
            .map { item in
                itemsDataService.convert(entity: item)
            }
            .sorted(by: {$0.timeToDo < $1.timeToDo})
            .filter{($0.state == 2)}
    }
    
    func delete(item: ItemModel) {
        itemsDataService.deleteItem(item: item)
        notificationManager.cancelNotification(id: item.id)
    }
    func moveToTodo(item : ItemModel) {
        itemsDataService.updateItem(item: item, title: item.title, color: item.color, icon: item.icon, date: item.timeToDo, description: item.description, loc: item.loc , state: 0)
        notificationManager.scheduleNotification(title: item.title, subtitle: item.description, id: item.id, date: item.timeToDo)
    }
    func moveToDoing(item: ItemModel) {
        itemsDataService.updateItem(item: item, title: item.title, color: item.color, icon: item.icon, date: item.timeToDo, description: item.description, loc: item.loc , state: 1)
        notificationManager.cancelNotification(id: item.id)
    }
    func moveToDone(item: ItemModel) {
        itemsDataService.updateItem(item: item, title: item.title, color: item.color, icon: item.icon, date: item.timeToDo, description: item.description, loc: item.loc , state: 2)
        notificationManager.cancelNotification(id: item.id)
    }
}
