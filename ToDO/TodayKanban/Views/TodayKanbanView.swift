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
        let height = UIScreen.main.bounds.height
        VStack (alignment: .leading){
            Text("Today")
                .font(.title)
                .fontWeight(.heavy)
                .padding()
            ScrollView {
                VStack (spacing: 6) {
                    HStack (alignment : .top){
                        KanbanColumns(isTargeted: $isTodoTargeted, width: width, height: height, color: .blue, title: "To do", items: vm.toDoItems, state: 0)
                            .environmentObject(vm)
                        KanbanColumns(isTargeted: $isDoingTargeted, width: width, height: height, color: .yellow, title: "Doing" , items: vm.doingItems, state: 1)
                            .environmentObject(vm)
                        KanbanColumns(isTargeted: $isDoneTargeted, width: width, height: height, color: .green, title: "Done" ,  items: vm.doneITems, state: 2)
                            .environmentObject(vm)
                    }
                }
            }
        }
    }
}

#Preview {
    TodayKanbanView(dependencies: Dependencies())
}
