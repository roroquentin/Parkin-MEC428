//
//  Home.swift
//  Parkin
//
//  Created by Hasan Güzelmansur on 15.11.2021.
//

import SwiftUI

struct Home: View {
    
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                if self.status{
                    
                   Map()
                    
                }else{
                    
                    ZStack{
                        
                        NavigationLink(destination: SignUp(show: self.$show), isActive: self.$show) {
                            
                            Text("")
                        }
                        .hidden()
                        
                        Login(show: self.$show)
                    }
                    
                }
                
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                    
                    self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                    
                }
                
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
