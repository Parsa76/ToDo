//
//  TodayCanbanView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 31.12.23.
//

import SwiftUI

struct TodayKanbanView: View {
    
    
    @StateObject var vm : TodayKanbanViewModel
    @State private var isTodoTargeted = false
    @State private var isDoingTargeted = false
    @State private var isDoneTargeted = false
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
                                .fill(isTodoTargeted ? Color.gray.opacity(0.5): Color.theme.background)
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
                        } isTargeted: { isTargeted in
                            isTodoTargeted = isTargeted
                        }
                        ZStack(alignment: .top) {
                            Rectangle()
                                .fill(isDoingTargeted ? Color.gray.opacity(0.5): Color.theme.background)
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
                        }   isTargeted: { isTargeted in
                                isDoingTargeted = isTargeted
                        }
                        ZStack(alignment: .top) {
                            Rectangle()
                                .fill(isDoneTargeted ? Color.gray.opacity(0.5): Color.theme.background)
                                .frame(width: width ,  height: UIScreen.main.bounds.height ,alignment: .top )
                                .background(Color.clear)
                            VStack {
                                KanbanColumnsHeadBox(color: .green, title: "Done")
                                KanbonColumnView(items: vm.doneITems)
                            }
                        }
                        .dropDestination(for: ItemModel.self) { items, location in
                            vm.moveToDone(items: items)
                            return true
                        } isTargeted: { isTargeted in
                            isDoneTargeted = isTargeted
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
