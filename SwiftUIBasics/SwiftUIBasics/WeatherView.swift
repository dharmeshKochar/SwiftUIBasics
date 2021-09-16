//
//  WeatherView.swift
//  SwiftUIBasics
//
//  Created by Admin on 15/09/21.
//

import SwiftUI

struct WeatherView: View {
    @State var selected = 1
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: selected == 2 ? Gradient(colors: [Color.black, Color.white]) : Gradient(colors: [Color.blue, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Picker(selection: $selected, label: Text("Picker"), content: {
                    Text("Day").tag(1)
                    Text("Night").tag(2)
                }).pickerStyle(SegmentedPickerStyle())
                Spacer()
                Image(systemName: "sunset.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                NavigationLink(
                    destination: WalkThroughView(),
                    label: {
                        Text("Navigate")
                    }).padding()
                Spacer()
                
            }
        }
    }
    
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
