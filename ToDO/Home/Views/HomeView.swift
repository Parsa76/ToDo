//
//  HomeView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 27.12.23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm : HomeViewModel
    @State var showCreateNewItemSheet: Bool = false
    @State var showEditView: Bool = false
    
    @State var itemToShow: ItemModel? = nil
    
    
    //Edit items
    @State var TitleToEdit: String = ""
    @State var locToEdit: String = ""
    @State var descToEdit: String = ""
    @State var dateToEdit: Date = Date()
    @State var iconToEdit: String = ""
    @State var colorToEdit: Int16 = 0
    @State var itemToEdit: ItemModel? = nil
    @State var showDetailsView: Bool = false
    
    
    let dependencies: Dependencies
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        _vm = StateObject(wrappedValue: HomeViewModel(dependencies: dependencies))
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
                        AddNewItemView(dependencies: dependencies)
                    })
                    .sheet(isPresented: $showEditView, content: {
                        EditCurrentItemView(title: $TitleToEdit, loc: $locToEdit, disc: $descToEdit, selectedDate: $dateToEdit, icon: $iconToEdit, color: $colorToEdit, item: itemToEdit, dependencies: dependencies)
                    })
                }
                ZStack {
                    if showDetailsView {
                        if let item = itemToShow {
                            DetailsView(item: item, showDetailsView: $showDetailsView)
                                .padding(.top, UIScreen.main.bounds.height / 2)
                                .transition(.move(edge: .bottom))
                                .animation(.spring())
                        }
                    }
                }
                .zIndex(2.0)
            }
            
            //.listStyle(.plain)
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
    private func showDetails(item : ItemModel) {
        if (item == itemToShow) {
            itemToShow = nil
            showDetailsView = false
        } else {
            itemToShow = item
            showDetailsView = true
        }
    }
    private var doingList: some View {
        ForEach(vm.doingItems) { item in
            ItemRowView(item: item)
                .onTapGesture {
                    showDetails(item: item)
                }
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
                        vm.itemsDataService.updateItem(item: item, title: item.title, color: item.color, icon: item.icon, date: item.timeToDo, description: item.description, loc: item.loc , state: 2)
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
                .onTapGesture {
                    showDetails(item: item)
                }
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
                .onTapGesture {
                    showDetails(item: item)
                }
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
        colorToEdit = item.color
        dateToEdit = item.timeToDo
        showEditView.toggle()
    }
}

#Preview {
    HomeView(dependencies: Dependencies())
}
