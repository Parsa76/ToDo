//
//  KanbonColumn.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 04.01.24.
//

import SwiftUI

struct KanbonColumnListView: View {
    let width = UIScreen.main.bounds.width / 3
    var items: [ItemModel]
    
    var body: some View {
        VStack(spacing: 6) {
            ForEach(items) { item in
                KanbanBoxView(item: item)
                    .draggable(item)
                }
            }
        .frame(width: width)
    }
    
}

#Preview {
    KanbonColumnListView(items: [])
}
