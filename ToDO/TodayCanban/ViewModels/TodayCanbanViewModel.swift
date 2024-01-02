//
//  TodayCanbanViewModel.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 31.12.23.
//

import Foundation
import Combine

class TodayCanbanViewModel :ObservableObject {
    
    @Published var toDoItems: [ItemModel] = []
    @Published var doneITems: [ItemModel] = []
    @Published var doingItems: [ItemModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    let itemsDataService: ItemDataService
    
    init(dependencies: Dependencies) {
        self.itemsDataService = dependencies.itemDataSevice
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
    }
    
    private func mapToDoItems(allItems: [ItemModel] ,itemEntities:[ItemEntity]) ->[ItemModel]{
    
       itemEntities
            .map { item in
                itemsDataService.convert(entity: item)
            }
            .sorted(by: {$0.timeToDo < $1.timeToDo})
            .filter{($0.state == 0)}
         //   .filter{$0.timeToDo.year == Date().year && $0.timeToDo.month == Date().month && $0.timeToDo.day == Date().day}
    }
    private func mapDoingItems(allItems: [ItemModel] ,itemEntities:[ItemEntity]) ->[ItemModel]{
    
       itemEntities
            .map { item in
                itemsDataService.convert(entity: item)
            }
            .sorted(by: {$0.timeToDo < $1.timeToDo})
            .filter{($0.state == 1)}
           // .filter{$0.timeToDo.year == Date().year && $0.timeToDo.month == Date().month && $0.timeToDo.day == Date().day}
    }
    private func mapDoneItems(allItems: [ItemModel] ,itemEntities:[ItemEntity]) ->[ItemModel]{
       itemEntities
            .map { item in
                itemsDataService.convert(entity: item)
            }
            .sorted(by: {$0.timeToDo < $1.timeToDo})
            .filter{($0.state == 2)}
        //    .filter{$0.timeToDo.year == Date().year && $0.timeToDo.month == Date().month && $0.timeToDo.day == Date().day}
    }
    
    func delete(item: ItemModel) {
        itemsDataService.deleteItem(item: item)
        
    }
    
}
