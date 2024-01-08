//
//  ItemRowView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 30.12.23.
//

import SwiftUI

struct ItemRowView: View {
    var item: ItemModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title3)
                    .foregroundStyle(Color.primary)
                    .bold()
            }
            Spacer()
            Text(item.timeToDo.formatted())
                .font(.subheadline)
                .foregroundStyle(item.timeToDo < Date() && item.state == 0 ? Color.red : Color.secondary)
            
        }
        .padding()
        .background(Color.clear)
    }
}

#Preview {
    ItemRowView(item: DeveloperPreview.instance.item)
}
