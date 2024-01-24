//
//  AddNewItemView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 28.12.23.
//

import SwiftUI

struct AddNewItemView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var vm : CreateAndEditViewModel
    
    @State var titleTextField:String = ""
    @State var locTextField:String = ""
    @State var desciptionTextField: String = ""
    @State var selectedColor: Color = .red
    @State var selectedSymbol: String = "curlybraces.square.fill"
    @State var sendNotification:Bool = false
    @State var selectedDate: Date = Date()
    
    let StartigDate: Date = Date()
    let endingDate: Date = Calendar.current.date(from: DateComponents(year: 2080)) ?? Date()
    

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                List {
                    Section {
                        TitleTextField(text: $titleTextField)
                    }
                    Section {
                        LocationTextField(textFieldText: $locTextField)
                    }
                    Section {
                        DateSelector(startigDate: StartigDate, endingDate: endingDate, selectedDate: $selectedDate, sendNotification: $sendNotification)
                    }
                    Section(header: Text("Description")) {
                        DescriptionTextField(desciptionTextField: $desciptionTextField)
                    }
                    Section {
                        IconView(color: selectedColor, symbol: selectedSymbol)
                    }
                    Section(header: Text("Pick a color")) {
                        ColorSelector(selectedColor: $selectedColor)
                    }
                    Section(header: Text("Pick an icon")) {
                        SymbolSelector(selectedSymbol: $selectedSymbol)
                    }
                }
                .listStyle(.sidebar)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    saveButton
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    deleteButton
                }
            }
        }
    }
}
extension AddNewItemView {


    private var saveButton: some View {
        Button {
            let id = UUID().uuidString
            vm.CreateAndSave(id: id , title: titleTextField, timeToDo: selectedDate, color: selectedColor.codeAsInt(), icon: selectedSymbol, loc: locTextField, description: desciptionTextField, state: 0 , notification: sendNotification)
            
            presentationMode.wrappedValue.dismiss()
        }label: {
            HStack {
                Image(systemName: "square.and.arrow.down")
                Text("Save")
            }
            .accentColor(.green)
            .disabled(titleTextField.count < 3)
        }
    }
    private var deleteButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        }label: {
            HStack {
                Image(systemName: "trash")
                Text("Delete")
            }.accentColor(.red)
        }
    }
    
}

#Preview {
    AddNewItemView()
        .environmentObject(CreateAndEditViewModel(dependencies: Dependencies()))
}
