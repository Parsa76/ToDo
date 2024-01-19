//
//  LocationTextField.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 19.01.24.
//

import SwiftUI

struct LocationTextField: View {
    @Binding var textFieldText: String
    var body: some View {
        HStack {
            Text("location : ")
            TextField("where ?", text: $textFieldText)
                .textFieldStyle(.automatic)
        }
    }
}

#Preview {
    LocationTextField(textFieldText: .constant(""))
}
