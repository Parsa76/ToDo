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
                .fontWeight(.semibold)
            Text(item.timeToDo.asShortDateString())
                .font(.subheadline)
                
        }
        .frame(width: lenght , height: lenght)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(item.state == 0 ? Color.blue : item.state == 1 ? Color.yellow : Color.green , lineWidth: 2)
        )
        
    }
}

#Preview {
    KanbanBoxView(item: DeveloperPreview.instance.item)
}
