//
//  SignUp.swift
//  Parkin
//
//  Created by Hasan Güzelmansur on 15.11.2021.
//

import SwiftUI
import Firebase

struct SignUp: View {
    
    @State var email = ""
    @State var password = ""
    @State var visible = false
    @State var repassword = ""
    @State var revisible = false
    @State var color = Color.black.opacity(0.7)
    @State var alert = false
    @State var error = ""
    @Binding var show : Bool
    
    var body: some View {
       
        ZStack() {
            
            ZStack(alignment: .topLeading){
                
                VStack{
                
                    Image("tdu")
                        .padding()
                    
                    Text("Lassen Sie uns den nächstgelegenen")
                        .font(.system(size: 20))
                        .padding(2)
                    Text("Parkplatz für Sie finden.")
                        .font(.system(size: 20))
                        .padding(2)
                    
                    Text("Parkleitinformationssystem Projekt")
                        .font(.system(size: 23))
                        .fontWeight(.bold)
                    
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
                    
                    HStack(spacing: 15){
                        
                        VStack{
                            
                            if self.revisible {
                                
                                TextField("Re-Passwort", text: self.$repassword)
                                    .autocapitalization(.none)
                                
                            }else{
                                
                                SecureField("Re-Passwort", text: self.$repassword)
                                    .autocapitalization(.none)
                                
                            }
                        }
                        
                        Button(action: {
                            
                            self.revisible.toggle()
                            
                        }) {
                            
                            Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(self.color)
                            
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).stroke(self.repassword != "" ? Color("Color") :
                                                                            self.color, lineWidth: 2))
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        self.register()
                        
                    }) {
                        
                        Text("Anmelden")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                        
                    }
                    .background(Color("Color"))
                    .cornerRadius(15)
                    .padding(.top, 25)
                    
                    
                }
                .padding()
                
                
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(Color("Color"))
                    
                }
                .padding([.leading, .bottom])
                .frame(width: 20)
                
                
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding(.bottom, 75)
        
        if self.alert{
            
            Error(alert: self.$alert, error: self.$error)
            
        }
        
    }
    
    func register(){
        
        if self.email != "" {
            
            if self.password == self.repassword {
                
                Auth.auth().createUser(withEmail: self.email, password: self.password) { (res, err) in
                    
                    if err != nil{
                        
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                        
                    }
                    
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                    
                }
                
            }else{
                
                self.error = "Password mismatch"
                self.alert.toggle()
            }
        }else{
         
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
            
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp(show: .constant(false))
    }
}
