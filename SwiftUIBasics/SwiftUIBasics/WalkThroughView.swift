//
//  WalkThroughView.swift
//  SwiftUIBasics
//
//  Created by Admin on 15/09/21.
//

import SwiftUI

struct WalkThroughView: View {
    var image = ["walk1","walk2","walk3"]
    var titles = ["Simple Shopping","Cheap Shoping","Just use your Phone"]
    var description = ["Scan or search products so make shopping lists and share with family and friend","Get coupons so make you shopping cheaper and scan them at checkout","Replace your massy physical card today and just use your phone"]
    var body: some View {
            TabView {
                OnboardingView(imageName: image[0], title: titles[0], description: description[0])
                OnboardingView(imageName: image[1], title: titles[1], description: description[1])
                OnboardingView(imageName: image[2], title: titles[2], description: description[2])
            }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .navigationTitle("Walkthrough")
    }
}

struct OnboardingView: View {
    let imageName: String
    let title: String
    let description: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .padding(32)
            VStack{
                Spacer()
                Text("Massy Stories")
                    .font(.title)
                    .padding()
                Spacer()
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                Text(title)
                    .font(.title3)
                    .padding()
                Spacer()
                Text(description)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                Spacer()
            } .padding(.horizontal,40)
            .transition(.slide)
        }
        .background(Color.orange)
    }
}


struct WalkThroughView_Previews: PreviewProvider {
    static var previews: some View {
        WalkThroughView()
    }
}
