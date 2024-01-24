//
//  DateSelector.swift
//  ToDO
//
//  Created by Parsa Keshavarz on 19.01.24.
//

import SwiftUI

struct DateSelector: View {
    var startigDate :Date
    var endingDate :Date
    @Binding var selectedDate:Date
    @Binding var sendNotification: Bool
    var body: some View {
        VStack (alignment: .center){
            DatePicker("Select a Date", selection: $selectedDate, in: startigDate...endingDate)
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
}

#Preview {
    let startigDate: Date = Date()
    let endingDate: Date = Calendar.current.date(from: DateComponents(year: 2080)) ?? Date()
    
    return DateSelector(startigDate: startigDate, endingDate: endingDate, selectedDate: .constant(Date()), sendNotification: .constant(false))
}
