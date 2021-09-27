//
//  WeatherView.swift
//  SwiftUIBasics
//
//  Created by Admin on 15/09/21.
//

import SwiftUI

struct WeatherView: View {
    @State var selected = 1
    let items: [Bookmark] = [.example,.example1,.example2]
    
    fileprivate func extractedFunc() -> List<Never, OutlineGroup<[Bookmark], UUID, TupleView<(Image, Text)>, TupleView<(Image, Text)>, DisclosureGroup<TupleView<(Image, Text)>, OutlineSubgroupChildren>>> {
        return List(items, children: \.items){ row in
            Image(systemName: row.icon)
                .renderingMode(.original)
            Text(row.name)
        }
    }
    
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
                Image(systemName: selected == 1 ? "sun.max.fill": "moon.stars.fill")
                    .renderingMode(.original)
                    .resizable()
                    .padding()
                    .frame(width: 120, height: 120)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(selected == 2 ? Color.gray : Color.yellow, lineWidth: 2))
                NavigationLink(
                    destination: WalkThroughView(),
                    label: {
                        Text("Navigate")
                    }).padding()
                extractedFunc()

            }
        }
    }
    
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

struct Bookmark :Identifiable{
    let id = UUID()
    let name: String
    let icon: String
    var items: [Bookmark]?
    
    static let some1 = Bookmark(name: "5-6", icon: "cloud.drizzle.fill")
    static let some2 = Bookmark(name: "8-12", icon: "cloud")
    static let some3 = Bookmark(name: "12-2", icon: "cloud.snow")
    static let some4 = Bookmark(name: "6-7", icon: "cloud.bolt.rain")
    
    static let example = Bookmark(name: "Morning", icon: "sunrise.fill", items: [Bookmark.some1,Bookmark.some2])
    static let example1 = Bookmark(name: "Evening", icon: "sun.haze.fill", items: [Bookmark.some4])
    static let example2 = Bookmark(name: "Night", icon: "moon.circle.fill", items: [Bookmark.some1,Bookmark.some2,Bookmark.some3])
}
