//
//  ItemRowView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 30.12.23.
//

import SwiftUI

struct ItemRowView: View {
    var item: ItemModel
    @State var showDetail: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.title3)
                        .foregroundStyle(Color.primary)
                        .bold()
                }
                Spacer()
                Button {
                    withAnimation(.spring) {
                        showDetail.toggle()
                    }
                    
                } label: {
                    Label("Details", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                }
            }
            Text(item.timeToDo.formatted())
                .font(.subheadline)
                .foregroundStyle(item.timeToDo < Date() && item.state == 0 ? Color.red : Color.secondary)
            if showDetail {
                DetailsView(item: item)
                    .transition(.moveInAndOut)
            }
        }
    }
}

#Preview {
    ItemRowView(item: DeveloperPreview.instance.item )
}
