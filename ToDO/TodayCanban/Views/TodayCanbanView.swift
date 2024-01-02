//
//  TodayCanbanView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 31.12.23.
//

import SwiftUI

struct TodayCanbanView: View {
    

    @StateObject var vm : TodayCanbanViewModel
    
    init(dependencies: Dependencies) {
        _vm = StateObject(wrappedValue: TodayCanbanViewModel(dependencies: dependencies))
    }
    var body: some View {
        
        let length = (UIScreen.main.bounds.width / 3) - 4
        ScrollView {
            HStack(alignment: .top ,spacing: 4) {
                VStack (spacing:6) {
                    
                    HStack(alignment: .top) {
                        CanbanColumnsHeadBox(color: .blue, title: "To do")
                        CanbanColumnsHeadBox(color: .yellow, title: "Doing")
                        CanbanColumnsHeadBox(color: .green, title: "Done")

                    }
                    
                    HStack (alignment : .top){
                        VStack(spacing:6) {
                            ForEach(vm.toDoItems) { i in
                                CanbanBoxView(item: i)
                            }
                        }
                        .frame(width: length)
                        VStack (spacing:6) {
                            ForEach(vm.doingItems) { i in
                                CanbanBoxView(item: i)
                            }
                        }
                        .frame(width: length)
                        VStack (spacing:6) {
                            ForEach(vm.doneITems) { i in
                                CanbanBoxView(item: i)
                            }
                        }
                        .frame(width: length)
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    TodayCanbanView(dependencies: Dependencies())
}
