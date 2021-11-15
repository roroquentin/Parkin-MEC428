//
//  Error.swift
//  Parkin
//
//  Created by Hasan Güzelmansur on 15.11.2021.
//

import SwiftUI

struct Error: View {
    
    @State var color = Color.black.opacity(0.7)
    @Binding var alert : Bool
    @Binding var error : String
    
    var body: some View {
        
        VStack{
            
            HStack{
                
                Text(self.error ==  "RESET" ? "Message" : "Error")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(self.color)
                
                Spacer()
            }
            .padding(.horizontal, 25)
            
            Text(self.error == "RESET" ? "Password reset link has been sent successfully" : self.error)
                .foregroundColor(self.color)
                .padding(.top)
                .padding(.horizontal, 25)
            
            Button(action: {
                
                self.alert.toggle()
                
            }) {
                
                Text(self.error == "RESET" ? "Ok" : "Cancel")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 150)
                    
                
            }
            .background(Color("Color"))
            .cornerRadius(10)
            .padding(.top, 25)
        }
        .padding(.vertical, 25)
        .frame(width: UIScreen.main.bounds.width - 70)
        .background(Color.white)
        .cornerRadius(15)
    }
    
}

struct Error_Previews: PreviewProvider {
    static var previews: some View {
        Error(alert: .constant(false), error: .constant("Hata var canım :)"))
    }
}
