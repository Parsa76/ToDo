//
//  TitleField.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 19.01.24.
//

import SwiftUI

struct TitleTextField: View {
    @Binding var text: String
    var body: some View {
        HStack {
            Text("Title : ")
            TextField("what are you going to do ?", text: $text)
                .textFieldStyle(.automatic)
        }
    }
}

#Preview {
    TitleTextField(text: .constant(""))
}
