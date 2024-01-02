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
                Text(item.timeToDo.formatted())
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
            }
            Spacer()
            IconRowView(color: item.color.decodeAsColor(), symbol: item.icon)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ItemRowView(item: DeveloperPreview.instance.item)
}
