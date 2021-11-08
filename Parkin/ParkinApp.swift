//
//  ParkinApp.swift
//  Parkin
//
//  Created by Hasan Güzelmansur on 8.11.2021.
//

import SwiftUI
import Firebase

@main
struct ParkinApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {

        WindowGroup {
            ContentView()
        }
    }
}
