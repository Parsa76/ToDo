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
        VStack {

            HStack(alignment: .center) {
                Text(item.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                Spacer()
                IconView(color: item.color.decodeAsColor(), symbol: item.icon)
                
            }
            .padding()
            Divider()
            VStack (alignment: .leading, spacing: 8) {
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
               
            }
            
            VStack (alignment: .leading){
                Text(item.timeToDo.asMediumDateString())
            }
            
            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.ultraThickMaterial)
        
    }
}

#Preview {
    DetailsView(item: DeveloperPreview.instance.item)
}
