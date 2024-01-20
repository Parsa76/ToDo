//
//  DetailsView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 31.12.23.
//

import SwiftUI

struct DetailsView: View {
    let item : ItemModel
    
 
    var body: some View {
            HStack(alignment: .center) {
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                IconRowView(color: item.color.decodeAsColor(), symbol: item.icon)
                
            }
            
    }
}

#Preview {
    DetailsView(item: DeveloperPreview.instance.item)
}
