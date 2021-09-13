//
//  ContentView.swift
//  SwiftUIBasics
//
//  Created by Admin on 13/09/21.
//

import SwiftUI

struct ContentView: View {
    
    private var symbols = ["heart","hand.thumbsup","flame"]
    @State private var numbers = [0,1,2]
    @State private var isHearted = false
    @State private var numHearts = 1125
    
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(.orange)
                    .edgesIgnoringSafeArea(.all)
                Rectangle()
                    .foregroundColor(.yellow.opacity(0.4))
                    .rotationEffect(Angle(degrees: 45))
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        Text("1 )")
                            .font(.title3)
                            .padding(5)
                        Image("img1")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .cornerRadius(10)
                        Spacer()
                        VStack(spacing:10 ){
                            Text("Mock Test C++")
                                .fontWeight(.heavy)
                                .font(.headline)
                            HStack{
                            Text("\u{20B9}\(599)")
                                .fontWeight(.medium)
                                .font(.subheadline)
                            Text("\u{20B9}\(2599)")
                                .fontWeight(.medium)
                                .font(.subheadline)
                                .strikethrough()
                            }
                            Text("Buy")
                                .bold()
                                .multilineTextAlignment(.center)
                                .padding(.all,8)
                                .padding(.horizontal,8)
                                .background(Color.white.opacity(0.5))
                                .cornerRadius(20)
                        }
                        Spacer()
                    }
                    HStack{
                        Button(action: {
                            self.isHearted.toggle()
                            if self.isHearted {
                                self.numHearts += 1
                            } else {
                                self.numHearts -= 1
                            }
                        }){
                            if isHearted {
                               Image(systemName: "heart.fill")
                            } else {
                                Image(systemName: "heart")
                            }
                    }
                        Text(String(numHearts))
                    }
                    .padding(10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                    Spacer()
                    HStack(spacing: 50){
                        Image(systemName: symbols[numbers[0]])
                        Image(systemName: symbols[numbers[1]])
                        Image(systemName: symbols[numbers[2]])
                    }
                    Button(action: {
                        self.numbers[0] = Int.random(in: 0...symbols.count - 1)
                        self.numbers[1] = Int.random(in: 0...symbols.count - 1)
                        self.numbers[2] = Int.random(in: 0...symbols.count - 1)
                    }, label: {
                        Text("Spin")
                            .bold().padding()
                    })
                Spacer()
            }
        }.navigationTitle("Deal for the day")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

