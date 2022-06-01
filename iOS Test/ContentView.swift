//
//  ContentView.swift
//  iOS Test
//
//  Created by Sazza on 31/5/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Explore", systemImage: "house.fill")
                }
                .tint(.white)
            CategoryView()
                .tabItem {
                    Label("Category", systemImage: "rectangle.fill.on.rectangle.fill")
                }
                .tint(.white)
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                .tint(.white)
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = .black
            UITabBar.appearance().backgroundColor = #colorLiteral(red: 0.1411762536, green: 0.1411766112, blue: 0.149767518, alpha: 1)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
