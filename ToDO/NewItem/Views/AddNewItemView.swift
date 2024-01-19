//
//  AddNewItemView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 28.12.23.
//

import SwiftUI

struct AddNewItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm : AddNewItemViewModel
    @State var titleTextField:String = ""
    @State var locTextField:String = ""
    @State var desciptionTextField: String = ""
    @State var selectedDate: Date = Date()
    @State var selectedColor: Color = .red
    @State var selectedSymbol: String = "curlybraces.square.fill"
    @State var sendNotification:Bool = false
    let StartigDate: Date = Date()
    let endingDate: Date = Calendar.current.date(from: DateComponents(year: 2080)) ?? Date()
    
    let columns : [GridItem] = [
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem()
    ]
    
    init(dependencies : Dependencies) {
        _vm = StateObject(wrappedValue: AddNewItemViewModel(dependencies: dependencies))
    }
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
                        customizedIcon
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
                    Button {
                        let id = UUID().uuidString
                        vm.saveToCoreData(id: id , title: titleTextField, timeToDo: selectedDate, color: selectedColor.codeAsInt(), icon: selectedSymbol, loc: locTextField, description: desciptionTextField, state: 0 , notification: sendNotification)
                        
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
                ToolbarItem(placement: .navigationBarLeading) {
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
        }
    }
}
extension AddNewItemView {

    private var customizedIcon: some View {
        HStack(alignment: .center){
            Spacer()
            IconView(color: selectedColor, symbol: selectedSymbol)
            Spacer()
        }
    }
    
}

#Preview {
    AddNewItemView(dependencies: Dependencies())
}
