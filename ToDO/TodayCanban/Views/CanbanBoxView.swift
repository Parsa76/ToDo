//
//  CanbanBoxView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 01.01.24.
//

import SwiftUI

struct CanbanBoxView: View {
    
    let item: ItemModel
    let lenght = (UIScreen.main.bounds.width / 3 ) - 4
    
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
                .fill(.ultraThickMaterial)
        )
    }
}

#Preview {
    CanbanBoxView(item: DeveloperPreview.instance.item)
}
