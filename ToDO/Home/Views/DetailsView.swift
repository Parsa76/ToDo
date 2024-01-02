//
//  DetailsView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 31.12.23.
//

import SwiftUI

struct DetailsView: View {
    let item : ItemModel
    @StateObject var vm: DetailsViewModel
    @State var state: Int16
    init(item: ItemModel ,dependencies: Dependencies) {
        _vm = StateObject(wrappedValue: DetailsViewModel(dependencies: dependencies))
        self.item = item
        _state = State(wrappedValue: item.state)
    }
    var body: some View {
        VStack {
            IconView(color: item.color.decodeAsColor(), symbol: item.icon)
            Text(item.title)
                .font(.title)
            Text(item.loc)
            Text(item.description)
            Text(item.timeToDo.formatted())
            HStack(spacing: 20) {
                if item.state != 0 {
                    Button(action: {
                        state = 0
                        vm.markasToDo(item: item)
                        
                    }, label: {
                        Text("mark as to do")
                    })
                }
                if item.state != 2 {
                    Button(action: {
                        state = 2
                        vm.markasDone(item: item)
                    }, label: {
                        Text("mark as done")
                    })
                }
                if item.state != 1 {
                    Button(action: {
                        state = 1
                        vm.markasDoing(item: item)
                    }, label: {
                        Text("mark as doing")
                            
                    })
                }
            }
        }
    }
}

#Preview {
    DetailsView(item: DeveloperPreview.instance.item, dependencies: Dependencies())
}
