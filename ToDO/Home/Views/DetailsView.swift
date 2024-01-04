//
//  DetailsView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 31.12.23.
//

import SwiftUI

struct DetailsView: View {
    let item : ItemModel
    @Binding var showDetailsView: Bool
 
    var body: some View {
        VStack {
            Button(action: {
                showDetailsView.toggle()
            }, label: {
                Image(systemName: "chevron.down")
                    .padding(.top)
                    .tint(.black)
                
            })
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
        .cornerRadius(30)
    }
}

#Preview {
    DetailsView(item: DeveloperPreview.instance.item, showDetailsView: .constant(true))
}
