//
//  TodayCanbanView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 31.12.23.
//

import SwiftUI

struct TodayKanbanView: View {
    
    
    @StateObject var vm : TodayKanbanViewModel
    
    init(dependencies: Dependencies) {
        _vm = StateObject(wrappedValue: TodayKanbanViewModel(dependencies: dependencies))
    }
    var body: some View {
        let width = UIScreen.main.bounds.width / 3
        VStack (alignment: .leading){
            Text("Today")
                .font(.title)
                .fontWeight(.heavy)
                .padding()
            ScrollView {
                VStack (spacing: 6) {
                    HStack (alignment : .top){
                        ZStack(alignment: .top) {
                            Rectangle()
                                .fill(Color.theme.background)
                                .frame(width: width ,  height: UIScreen.main.bounds.height ,alignment: .top )
                                .background(Color.clear)
                            VStack {
                                KanbanColumnsHeadBox(color: .blue, title: "To do")
                                KanbonColumnView(items: vm.toDoItems)
                            }
                        }
                        .dropDestination(for: ItemModel.self) { items, location in
                            vm.moveToTodo(items: items)
                            return true
                        }
                        ZStack(alignment: .top) {
                            Rectangle()
                                .fill(Color.theme.background)
                                .frame(width: width ,  height: UIScreen.main.bounds.height ,alignment: .top )
                                .background(Color.clear)
                            VStack {
                                KanbanColumnsHeadBox(color: .yellow, title: "Doing")
                                KanbonColumnView(items: vm.doingItems)
                            }
                        }
                        .dropDestination(for: ItemModel.self) { items, location in
                            vm.moveToDoing(items: items)
                            return true
                        }
                        ZStack(alignment: .top) {
                            Rectangle()
                                .fill(Color.theme.background)
                                .frame(width: width ,  height: UIScreen.main.bounds.height ,alignment: .top )
                                .background(Color.black)
                            VStack {
                                KanbanColumnsHeadBox(color: .green, title: "Done")
                                KanbonColumnView(items: vm.doneITems)
                            }
                        }
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
