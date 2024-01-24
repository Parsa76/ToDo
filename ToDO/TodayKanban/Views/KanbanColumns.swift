//
//  KanbanColumns.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 19.01.24.
//

import SwiftUI

struct KanbanColumns: View {
    @Binding var isTargeted :Bool
    @EnvironmentObject var vm: TodayKanbanViewModel
    let width: CGFloat
    let height: CGFloat
    let color: Color
    var title: String
    let items: [ItemModel]
    let state: Int16
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 10)
                .fill(isTargeted ? Color.gray.opacity(0.5): Color.theme.background)
                .frame(width: width ,  height: height  ,alignment: .top )
                .background(Color.clear)
            VStack {
                KanbanColumnsHeadBox(color: color, title: title)
                KanbonColumnListView(items: items)
            }
        }
        .dropDestination(for: ItemModel.self) { items, location in
            switch state {
                case 0:
                    vm.moveToTodo(items: items)
                    return true
                case 1:
                    vm.moveToDoing(items: items)
                return true
                case 2:
                    vm.moveToDone(items: items)
                    return true
                default:
                    vm.moveToDone(items: items)
                    return true
            }
            
        } isTargeted: { isTargeted in
            self.isTargeted = isTargeted
        }
    }
}

#Preview {
    KanbanColumns(isTargeted: .constant(true) ,
                  width: UIScreen.main.bounds.width / 4,
                  height: UIScreen.main.bounds.height ,
                  color: .blue ,
                  title: "To Do" ,
                  items: [] ,
                  state: 0)
        .environmentObject(TodayKanbanViewModel(dependencies: Dependencies()))
}
