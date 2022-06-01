//
//  HomeView.swift
//  iOS Test
//
//  Created by Sazza on 31/5/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            ZStack{
                VStack{
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame( height: 220)
                        .opacity(0.7)
                    Spacer()
                }
                VStack{
                    Spacer(minLength: 34)
                    ZStack{
                        Text("Explore")
                            .font(.system(size: 32, weight: .black, design: .rounded))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 1, x: 2, y: 1)
                        HStack{
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                    //.padding(.top,50)
                    ImageCarousel(images: carousel)
                        .padding(.top,-30)
                    ForEach(0..<4, id:\.self){ item in
                        VStack {
                            HStack {
                                Text("Quotes")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                                Spacer()
                                Text("More")
                                    .foregroundColor(.gray)
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            Image("imgL1")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(8)
                        }
                        .padding()
                    }
                }
            }
        }
        
        .edgesIgnoringSafeArea(.top)
        .background(Color.black)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
            HomeView()
                .previewDevice("iPhone 8")
        }
    }
}
