//
//  Map.swift
//  Parkin
//
//  Created by Hasan Güzelmansur on 15.11.2021.
//

import SwiftUI
import Firebase

struct Map: View {
    var body: some View {
        VStack {
            
            Text("Logged successfully")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black.opacity(0.7))
            
            Button(action: {
                
                try! Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                
            }) {
                
                Text("Log out")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
                
            }
            .background(Color("Color"))
            .cornerRadius(15)
            .padding(.top, 25)
            
        }
    }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        Map()
    }
}
