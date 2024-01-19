//
//  DescriptionTextField.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 19.01.24.
//

import SwiftUI

struct DescriptionTextField: View {
    @Binding var desciptionTextField: String
    var body: some View {
        HStack {
            TextField("Describe it in some Details...", text: $desciptionTextField , axis: .vertical)
                .lineLimit(4...6)
        }
    }
}

#Preview {
    DescriptionTextField(desciptionTextField: .constant(""))
}
