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
    @Binding var color: Color
    @Binding var icon: String
    
    var item : ItemModel
    
    let StartigDate: Date
    let endingDate: Date = Calendar.current.date(from: DateComponents(year: 2080)) ?? Date()
    @State var sendNotification : Bool = true
    

    
    let columns : [GridItem] = [
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem()
    ]
    
    init(title: Binding<String> ,loc: Binding<String> , disc: Binding<String> , selectedDate: Binding<Date> , icon: Binding<String> , color: Binding<Color> , item: ItemModel , dependencies: Dependencies) {
        _vm = StateObject(wrappedValue: EditItemViewModel(dependencies: dependencies))
        self.item = item
        self._title = title
        self._loc = loc
        self._disc = disc
        self._selectedDate = selectedDate
        self._icon = icon
        self._color = color
        
        StartigDate = min(Date(), selectedDate.wrappedValue)
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                List {
                    Section {
                        TitleTextField(text: $title)
                    }
                    Section {
                        LocationTextField(textFieldText: $loc)
                    }
                    Section {
                        DateSelector(startigDate: StartigDate, endingDate: endingDate, selectedDate: $selectedDate, sendNotification: $sendNotification)
                    }
                    Section(header: Text("Description")) {
                        DescriptionTextField(desciptionTextField: $disc)
                    }
                    Section {
                        customizedIcon
                    }
                    Section(header: Text("Pick a color")) {
                        ColorSelector(selectedColor: $color)
                    }
                    Section(header: Text("Pick an icon")) {
                        SymbolSelector(selectedSymbol: $icon)
                        
                    }
                }
                .listStyle(.sidebar)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        vm.updateItem(item: item, title: title, loc: loc, description: disc, selectedDate: selectedDate, color: color.codeAsInt(), icon: icon, remeinder: sendNotification)
                        
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
                            Text("discard changes")
                        }.accentColor(.red)
                    }
                }
            }
        }
    }
}
extension EditCurrentItemView {
    private var customizedIcon: some View {
        HStack(alignment: .center){
            Spacer()
            IconView(color: color, symbol: icon)
            Spacer()
        }
    }

}

#Preview {
    EditCurrentItemView(title: .constant(""), loc: .constant(""), disc: .constant(""), selectedDate: .constant(Date()), icon: .constant(""), color: .constant(.red), item: DeveloperPreview.instance.item , dependencies: Dependencies())
}
