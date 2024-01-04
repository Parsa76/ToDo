//
//  CanbanBoxView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 01.01.24.
//

import SwiftUI

struct KanbanBoxView: View {
    
    let item: ItemModel
    let lenght = (UIScreen.main.bounds.width / 4 ) 
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(.title3)
            Text(item.timeToDo.asShortDateString())
                .font(.subheadline)
        }
        .frame(width: lenght , height: lenght)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.theme.background)
                
        )
        
    }
}

#Preview {
    KanbanBoxView(item: DeveloperPreview.instance.item)
}
