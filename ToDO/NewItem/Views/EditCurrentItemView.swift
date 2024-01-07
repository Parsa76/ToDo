//
//  EditCurrentItemView.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 04.01.24.
//

import SwiftUI

struct EditCurrentItemView: View {
    @StateObject var vm : EditItemViewModel
    @Environment(\.presentationMode) var presentationMode
    
    
    @Binding var title: String
    @Binding var loc: String
    @Binding var disc: String
    @Binding var selectedDate: Date
    @Binding var color: Int16
    @Binding var icon: String
    var item : ItemModel?
    
    let StartigDate: Date = Date()
    let endingDate: Date = Calendar.current.date(from: DateComponents(year: 2080)) ?? Date()
    @State var sendNotification : Bool = true
    

    
    let columns : [GridItem] = [
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem()
    ]
    
    init(title: Binding<String> ,loc: Binding<String> , disc: Binding<String> , selectedDate: Binding<Date> , icon: Binding<String> , color: Binding<Int16> , item: ItemModel? , dependencies: Dependencies) {
        self._title = title
        self._loc = loc
        self._disc = disc
        self._selectedDate = selectedDate
        self._icon = icon
        self._color = color
        self.item = item
        _vm = StateObject(wrappedValue: EditItemViewModel(dependencies: dependencies))
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
                        vm.updateItem(item: item, title: title, loc: loc, description: disc, selectedDate: selectedDate, color: color, icon: icon, remeinder: sendNotification)
                        
                        presentationMode.wrappedValue.dismiss()
                    }label: {
                        HStack {
                            Image(systemName: "square.and.arrow.down")
                            Text("Save")
                        }
                        .accentColor(.green)
                        .disabled(title.count < 3)
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
extension EditCurrentItemView {
    private var titleSection: some View {
        HStack {
            Text("Title : ")
            TextField("what are you going to do ?", text: $title)
                .textFieldStyle(.automatic)
        }
    }
    private var locSection: some View {
        HStack {
            Text("location : ")
            TextField("where ?", text: $loc)
                .textFieldStyle(.automatic)
        }
    }
    private var descriptionSection: some View {
        HStack {
            TextField("Describe it in some Details...", text: $disc , axis: .vertical)
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
            IconView(color: color.decodeAsColor(), symbol: icon)
            Spacer()
        }
    }
  
    private var colorPickerSection: some View {
        
        LazyVGrid(columns: columns){
            ForEach(vm.colors.indices) { index in
                ColorCircleView(color: vm.colors[index], selected: color.decodeAsColor() == vm.colors[index])
                    .onTapGesture {
                        color = vm.colors[index].codeAsInt()
                        
                    }
            }
        }
    }
    private var pcikSymbolSection: some View {
        LazyVGrid(columns: columns) {
            ForEach(vm.symbol.indices) { index in
                SymbolView(symbol: vm.symbol[index], selected: icon == vm.symbol[index])
                    .onTapGesture {
                        icon = vm.symbol[index]
                    }
            }
        }
    }
}

#Preview {
    EditCurrentItemView(title: .constant(""), loc: .constant(""), disc: .constant(""), selectedDate: .constant(Date()), icon: .constant(""), color: .constant(0), item: DeveloperPreview.instance.item , dependencies: Dependencies())
}
