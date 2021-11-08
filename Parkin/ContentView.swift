//
//  ContentView.swift
//  Parkin
//
//  Created by Hasan Güzelmansur on 8.11.2021.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
