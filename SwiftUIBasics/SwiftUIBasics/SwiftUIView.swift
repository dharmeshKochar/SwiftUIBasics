//
//  SwiftUIView.swift
//  SwiftUIBasics
//
//  Created by Admin on 15/09/21.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State private var name = ""
    @State private var email = ""
    @State private var dob = Date()
    @State private var shouldSendTest = false
    @State private var noOfTest = 1
    
    var body: some View {
            Form{
                Section(header: Text("Information")) {
                    TextField("Full Name", text: $name)
                    TextField("Email", text: $email)
                    DatePicker("BirthDate", selection: $dob, displayedComponents: .date)
                }
                Section(header: Text("Service")) {
                    Toggle("Send Mock Test", isOn:$shouldSendTest)
                    Stepper("No. of Test",value: $noOfTest, in: 1...10)
                    Text("You will receive \(noOfTest) mock tests")
                }
                NavigationLink(
                    destination: WeatherView(),
                    label: {
                        Text("Save")
                    })
            }.navigationTitle("Account")
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
