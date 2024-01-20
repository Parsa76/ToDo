//
//  HomeView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 27.12.23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm : HomeViewModel
    @StateObject var createEditVM: CreateAndEditViewModel // for sub views
    @State var showCreateNewItemSheet: Bool = false
    
    //Edit items
    @State var itemToEdit: ItemModel? = nil
    @State var TitleToEdit: String = ""
    @State var locToEdit: String = ""
    @State var descToEdit: String = ""
    @State var dateToEdit: Date = Date()
    @State var iconToEdit: String = ""
    @State var colorToEdit: Color = .red
    
    let dependencies: Dependencies
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        
        _vm = StateObject(wrappedValue:
            HomeViewModel(dependencies: dependencies))
        
        _createEditVM = StateObject(wrappedValue: CreateAndEditViewModel(dependencies: dependencies))
    }
    var body: some View {
            ZStack {
                VStack {
                    List {
                        Section(header: 
                        HStack {
                            Image(systemName: "bookmark.circle.fill")
                            Text("To do :")
                        }.fontWeight(.heavy)
                            .foregroundStyle(Color.blue)
                            
                        ) {
                            todoList
                                
                        }
                        .headerProminence(.increased)
                        Section(header: 
                                    HStack {
                            Image(systemName: "hourglass.circle")
                            Text("Doing items")
                        }.foregroundStyle(Color.yellow)
                            .fontWeight(.heavy)
                                    ) {
                            doingList
                        }
                        .headerProminence(.increased)
                        Section (header: HStack {
                            Image(systemName: "checkmark.circle")
                            Text("Already done Items:")
                        }.foregroundStyle(Color.green)
                            .fontWeight(.heavy)
                                    ){
                            doneList
                        }
                        .headerProminence(.increased)
                    }
                    .sheet(isPresented: $showCreateNewItemSheet, content: {
                        AddNewItemView()
                            .environmentObject(createEditVM)
                    })
                    .sheet(item: $itemToEdit){ item in
                        EditCurrentItemView(title: $TitleToEdit, loc: $locToEdit, disc: $descToEdit, selectedDate: $dateToEdit, icon: $iconToEdit, color: $colorToEdit, item: item)
                            .environmentObject(createEditVM)
                    }
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showCreateNewItemSheet = true
                    }, label: {
                        Image(systemName: "plus")
                            .tint(Color.primary)
                    })
                }
        }
        
    }
}
extension HomeView {
    private var doingList: some View {
        ForEach(vm.doingItems) { item in
            ItemRowView(item: item)
               
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button (role: .destructive) {
                        vm.delete(item: item)
                    } label: {
                        Image(systemName: "trash")
                    }
                    Button (role: .cancel) {
                        updateItemsToEdit(item: item)
                    } label: {
                        Text("Edit")
                    }.tint(.purple)
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button (role: .cancel) {
                        vm.moveToDone(item: item)
                    } label: {
                        Image(systemName: "checkmark.circle")
                        
                    }
                    .tint(.green)
                    Button (role: .cancel) {
                        vm.moveToTodo(item: item)
                    } label: {
                        Image(systemName: "bookmark.circle.fill")
                        
                    }
                    .tint(.blue)
                }
        }
    }
    
    private var todoList: some View {
        ForEach(vm.toDoItems) { item in
            ItemRowView(item: item)
                
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button (role: .destructive) {
                        vm.delete(item: item)
                    } label: {
                        Image(systemName: "trash")
                    }
                    Button (role: .cancel) {
                        updateItemsToEdit(item: item)
                    } label: {
                        Text("Edit")
                    }.tint(.purple)
                    
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button (role: .cancel) {
                        vm.moveToDone(item: item)
                    } label: {
                        Image(systemName: "checkmark.circle")
                        
                    }.tint(.green)
                    Button (role: .cancel) {
                        vm.moveToDoing(item: item)
                    } label: {
                        Image(systemName: "hourglass.circle")
                    }.tint(.yellow)
                    
                }
        }
    }
    private var doneList: some View {
        ForEach(vm.doneITems) { item in
            ItemRowView(item: item)
               
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button (role: .destructive) {
                        vm.delete(item: item)
                    } label: {
                        Image(systemName: "trash")
                    }
                    Button (role: .cancel) {
                        updateItemsToEdit(item: item)
                    } label: {
                        Text("Edit")
                    }.tint(.purple)
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button (role: .cancel) {
                        vm.moveToTodo(item: item)
                    } label: {
                        Image(systemName: "bookmark.circle.fill")
                        
                    }.tint(.blue)
                    
                    Button (role: .cancel) {
                        vm.moveToDoing(item: item)
                    } label: {
                        Image(systemName: "hourglass.circle")
                        
                    }.tint(.yellow)
                }
            
        }
    }
    func updateItemsToEdit(item: ItemModel) {
        itemToEdit = item
        TitleToEdit = item.title
        locToEdit = item.loc
        descToEdit = item.description
        iconToEdit = item.icon
        colorToEdit = item.color.decodeAsColor()
        dateToEdit = item.timeToDo
    }
}

#Preview {
    HomeView(dependencies: Dependencies())
}
