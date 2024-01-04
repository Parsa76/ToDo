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
    
    @State var itemToShow: ItemModel? = nil
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
                        Section(header: Text("To do :")) {
                            todoList
                        }
                        .headerProminence(.increased)
                        Section(header: Text("Doing items")) {
                            doingList
                        }
                        .headerProminence(.increased)
                        Section (header: Text("Already done Items:")){
                            doneList
                        }
                        .headerProminence(.increased)
                    }
                    .sheet(isPresented: $showCreateNewItemSheet, content: {
                        AddNewItemView(dependencies: dependencies)
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

        
        .navigationTitle("To Do")
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
            }
            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                Button (role: .cancel) {
                    vm.itemsDataService.updateItem(item: item, title: item.title, color: item.color, icon: item.icon, date: item.timeToDo, description: item.description, loc: item.loc , state: 2)
                } label: {
                    Text("mark as done")
                    
                }
                .tint(.green)
                Button (role: .cancel) {
                    vm.moveToTodo(item: item)
                } label: {
                    Text("mark as to do")
                    
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
            }
            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                Button (role: .cancel) {
                    vm.moveToDone(item: item)
                } label: {
                    Text("mark as done")
                        
                }.tint(.green)
                Button (role: .cancel) {
                    vm.moveToDone(item: item)
                } label: {
                    Text("mark as doing")
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
            }
            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                Button (role: .cancel) {
                    vm.itemsDataService.updateItem(item: item, title: item.title, color: item.color, icon: item.icon, date: item.timeToDo, description: item.description, loc: item.loc , state: 0)
                } label: {
                    Text("mark as to do")
                        
                }.tint(.blue)
                
                Button (role: .cancel) {
                    vm.itemsDataService.updateItem(item: item, title: item.title, color: item.color, icon: item.icon, date: item.timeToDo, description: item.description, loc: item.loc , state: 1)
                } label: {
                    Text("mark as doing")
                        
                }.tint(.yellow)
            }
            
        }
    }
}

#Preview {
    HomeView(dependencies: Dependencies())
}
