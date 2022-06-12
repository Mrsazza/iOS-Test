//
//  iOS_TestApp.swift
//  iOS Test
//
//  Created by Sazza on 31/5/22.
//

import SwiftUI
import Firebase

@main
struct iOS_TestApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//            TestView()
        }
    }
}
