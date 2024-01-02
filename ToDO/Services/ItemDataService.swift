//
//  ItemDataService.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 27.12.23.
//

import Foundation
import CoreData

class ItemDataService {
    private let container: NSPersistentContainer
    private let containerName: String = "ItemContainer"
    private let entityName: String = "ItemEntity"
    
    @Published var savedEntities: [ItemEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (_, error) in
            if let error = error {
                print("Error loading Core Data! \(error)")
            }
            self.getItems()
        }
    }
    // MARK: PUBLIC
    func updateItem(item: ItemModel ,title: String , color: Int16, icon: String , date: Date , description:String , loc: String ,state :Int16) {
        if let entity = savedEntities.first(where: { $0.itemID ==  item.id}) {
            update(entity: entity, title: title, color: color, icon: icon, date: date, description: description, loc: loc, state: state)
        }
        
    }
    func addNewItem(item: ItemModel) {
        add(item: item)
    }
    func deleteItem(item: ItemModel) {
        if let entity = savedEntities.first(where: { $0.itemID ==  item.id}) {
            delete(entity: entity)
        }
    }
    func convert(entity : ItemEntity) -> ItemModel {
        return ItemModel(id: entity.itemID ?? "", title: entity.title ?? "", timeToDo: entity.date ?? Date(), color: entity.color, icon: entity.icon ?? "", loc: entity.loc ?? "", description: entity.itemDescription ?? "", state: entity.state)
    }
    // MARK: PRIVATE
    private func getItems() {
        let request = NSFetchRequest<ItemEntity>(entityName: entityName)
        do {
             savedEntities =  try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching Item Entities.\(error)")
        }
    }
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to Core Data\(error)")
        }
    }
    private func applyChanges() {
        save()
        getItems()
    }
    private func add(item: ItemModel) {
        let entity = ItemEntity(context: container.viewContext)
        entity.itemID = item.id
        entity.title = item.title
        entity.color = item.color
        entity.date = item.timeToDo
        entity.icon = item.icon
        entity.itemDescription = item.description
        entity.loc = item.loc
        applyChanges()
    }
    private func delete(entity: ItemEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    private func update(entity: ItemEntity , title: String , color: Int16, icon: String , date: Date , description:String , loc: String, state: Int16) {
        entity.title = title
        entity.color = color
        entity.date = date
        entity.icon = icon
        entity.itemDescription = description
        entity.loc = loc
        entity.state = state
        applyChanges()
    }
}
