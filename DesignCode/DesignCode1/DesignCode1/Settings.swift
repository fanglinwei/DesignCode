//
//  Settings.swift
//  DesignCode
//
//  Created by 方林威 on 2021/5/24.
//

import SwiftUI

struct Settings: View {
    
    @State var receive = false
    
    @State var number = 0
    
    @State var selection = 0
    
    @State var date = Date()
    
    @State var email = "@"
    
    @State var submit = false
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $receive) {
                    Text("Receive notifications")
                }
                
                Stepper(value: $number, in: 1 ... 10) {
                    Text("\(number)Notification\(number > 1 ? "s" : "") per work")
                }
                
                Section(header: Text("Picker")) {
                    Picker("Favorite course", selection: $selection) {
                        Text("SwiftUI").tag(0)
                        Text("React").tag(1)
                        Text("Vue").tag(2)
                        Text("LEE").tag(3)
                    }
    //                .pickerStyle(SegmentedPickerStyle())
//                    .pickerStyle(MenuPickerStyle())
//                    .pickerStyle(WheelPickerStyle())
//                    .pickerStyle(InlinePickerStyle())
                    
                    DatePicker("Date", selection: $date)
    //                    .datePickerStyle(WheelDatePickerStyle())
    //                    .datePickerStyle(GraphicalDatePickerStyle())
                }
                
                Section(header: Text("Email")) {
                    TextField("Your email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Submit") { submit.toggle() }
                        .alert(isPresented: $submit) {
                            Alert(
                                title: Text("Submit"),
                                message: Text("\(email)"))
                        }
                }
                
            }.navigationTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
