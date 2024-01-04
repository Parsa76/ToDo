//
//  TodayCanbanView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 31.12.23.
//

import SwiftUI

struct TodayKanbanView: View {
    

    @StateObject var vm : TodayCanbanViewModel
    
    init(dependencies: Dependencies) {
        _vm = StateObject(wrappedValue: TodayCanbanViewModel(dependencies: dependencies))
    }
    var body: some View {
        
        let length = (UIScreen.main.bounds.width / 3) - 4
        let height = UIScreen.main.bounds.height
        let heightTitle = ((UIScreen.main.bounds.width / 3) - 4) * 5/8
        ScrollView {
            HStack(alignment: .top ,spacing: 4) {
                VStack (spacing:6) {
                    
                    HStack(alignment: .top) {
                        KanbanColumnsHeadBox(color: .blue, title: "To do")
                        KanbanColumnsHeadBox(color: .yellow, title: "Doing")
                        KanbanColumnsHeadBox(color: .green, title: "Done")

                    }
                    HStack (alignment : .top){
                        ZStack {
                            VStack(spacing:6) {
                                ForEach(vm.toDoItems) { i in
                                    KanbanBoxView(item: i)
                                        .draggable(i)
                                }
                            }
                            .frame(width: length )

                        }
                        
                        
                        .background(Color.clear)
                        .frame(width: length ,height: .infinity)
                        .dropDestination(for: ItemModel.self) { items, location in
                            vm.moveToTodo(items: items)
                            return true
                        }
                      
                        ZStack {
                            VStack ( spacing:6) {
                                ForEach(vm.doingItems) { i in
                                    KanbanBoxView(item: i)
                                        .draggable(i)
               
                                }
                            }
                            .frame(width: length )

                        }
                        
                        
                        .background(Color.clear)
                        .frame(width: length , height: .infinity)
                        .dropDestination(for: ItemModel.self) { items, location in
                            vm.moveToDoing(items: items)
                            return true
                        }
                        
                        ZStack {
                            VStack (spacing:6) {
                                ForEach(vm.doneITems) { i in
                                    KanbanBoxView(item: i)
                                        .draggable(i)
                                }
                            }
                            .frame(width: length )
                            
                        }
                        
                        
                        .background(Color.clear)
                        .frame(width: length ,height: .infinity)
                        .dropDestination(for: ItemModel.self) { items, location in
                            vm.moveToDone(items: items)
                            return true
                        }

                        
                        

                        
                        
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    TodayKanbanView(dependencies: Dependencies())
}
