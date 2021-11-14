//
//  Login.swift
//  Parkin
//
//  Created by Hasan Güzelmansur on 14.11.2021.
//

import SwiftUI

struct Login: View {
    
    @State var email = ""
    @State var password = ""
    @State var visible = false
    @State var color = Color.black.opacity(0.7)

    
    var body: some View {
        
        VStack{
            Image("tdu")
            
            HStack{
                Image("fev")
                Spacer()
                Image("tubitak")
            }
            .padding()
            
            Text("MEC428 - Intelligente Systeme")
                .font(.system(size: 20))
                .padding(2)
            Text("Parkleitinformationssystem Projekt")
                .font(.system(size: 20))
                .padding(2)
            
            TextField("E-Mail", text: self.$email)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                .padding(.top, 25)
            
            HStack(spacing: 15){
                
                VStack{
                    
                    if self.visible {
                        
                        TextField("Passwort", text: self.$password)
                            .autocapitalization(.none)
                        
                    }else{
                        
                        SecureField("Passwort", text: self.$password)
                            .autocapitalization(.none)
                        
                    }
                }
                
                Button(action: {
                    
                    self.visible.toggle()
                    
                }) {
                    
                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(self.color)
                    
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 15).stroke(self.password != "" ? Color("Color") :
                                                                    self.color, lineWidth: 2))
            .padding(.top, 25)
            
            HStack{
                
                Spacer()
                
                Button(action:  {
                    
                    
                    
                }) {
                    
                    Text("Passwort vergessen?")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color"))
                    
                }
                
            }
            .padding(.top, 10)
            
            Button(action: {
                
                
                
            }) {
                
                Text("Anmelden")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 150)
                
            }
            .background(Color("Color"))
            .cornerRadius(15)
            .padding(.top, 25)
            
            
            HStack{
                
                Spacer()
                
                Button(action: {
                    
                    
                    
                }) {
                    
                    Text("Ich habe noch keine Account.")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color"))
                    
                }
                
            }
            .padding(.top, 25)
            
        }
        .padding()
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
