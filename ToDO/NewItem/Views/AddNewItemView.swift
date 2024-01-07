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
    @State var disciptionTextField: String = ""
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
                        titleSection
                    }
                    Section {
                        locSection
                    }
                    Section {
                        datePickerSection
                    }
                    Section(header: Text("Discription")) {
                        descriptionSection
                    }
                    Section {
                        customizedIcon
                    }
                    Section(header: Text("Pick a color")) {
                        colorPickerSection
                    }
                    Section(header: Text("Pick an icon")) {
                        pcikSymbolSection
                    }
                }
                .listStyle(.sidebar)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let id = UUID().uuidString
                        vm.saveToCoreData(id: id , title: titleTextField, timeToDo: selectedDate, color: selectedColor.codeAsInt(), icon: selectedSymbol, loc: locTextField, description: disciptionTextField, state: 0 , notification: sendNotification)
                        
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
    private var titleSection: some View {
        HStack {
            Text("Title : ")
            TextField("what are you going to do ?", text: $titleTextField)
                .textFieldStyle(.automatic)
        }
    }
    private var locSection: some View {
        HStack {
            Text("location : ")
            TextField("where ?", text: $locTextField)
                .textFieldStyle(.automatic)
        }
    }
    private var descriptionSection: some View {
        HStack {
            TextField("Describe it in some Details...", text: $disciptionTextField , axis: .vertical)
                .lineLimit(4...6)
        }
    }
    private var datePickerSection: some View {
        VStack (alignment: .center){
            DatePicker("Select a Date", selection: $selectedDate, in: StartigDate...endingDate)
                .datePickerStyle(.compact)
            HStack {
                Toggle(
                    isOn: $sendNotification,
                    label: {
                    Text("Send me a reminder")
                    })
            }

        }
        
    }
    private var customizedIcon: some View {
        HStack(alignment: .center){
            Spacer()
            IconView(color: selectedColor, symbol: selectedSymbol)
            Spacer()
        }
    }
  
    private var colorPickerSection: some View {
        
        LazyVGrid(columns: columns){
            ForEach(vm.colors.indices) { index in
                ColorCircleView(color: vm.colors[index], selected: selectedColor == vm.colors[index])
                    .onTapGesture {
                        selectedColor = vm.colors[index]
                    }
            }
        }
    }
    private var pcikSymbolSection: some View {
        LazyVGrid(columns: columns) {
            ForEach(vm.symbol.indices) { icon in
                SymbolView(symbol: vm.symbol[icon], selected: selectedSymbol == vm.symbol[icon])
                    .onTapGesture {
                        selectedSymbol = vm.symbol[icon]
                    }
            }
        }
    }
    
}

#Preview {
    AddNewItemView(dependencies: Dependencies())
}
