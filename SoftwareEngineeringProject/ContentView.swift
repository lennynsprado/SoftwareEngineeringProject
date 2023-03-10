//
//  ContentView.swift
//  SoftwareEngineeringProject
//
//  Created by Lennyn Stephano Prado on 2/7/23.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    //Variables
    @State private var username = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    
    var body: some View {
        
        ZStack{
            Color.black
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            VStack(spacing: 20){
                Text("MScoots")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -90, y: -190)
                TextField("Username", text: $username)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .offset(y: -170)
                    .placeholder(when: username.isEmpty){
                        Text("Username")
                            .foregroundColor(.white)
                            .bold()
                            .offset(y: -170)
                    }
                
                Rectangle()
                    .frame(width: 350, height: 3)
                    .foregroundColor(.white)
                    .offset(y: -170)
                
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .offset(y: -160)
                    .placeholder(when: password.isEmpty){
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                            .offset(y: -160)
                    }
                
                Rectangle()
                    .frame(width: 350, height: 3)
                    .foregroundColor(.white)
                    .offset(y: -160)
                
                Button{
                    register()
                } label: {
                    Text("Sign Up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing))
                        )
                        .foregroundColor(.white)
                }
                
                Button{
                 login()
                } label: {
                    Text("Already have an account? Log In")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top)
                        
                }
            }
            .frame(width: 350)
        }
        .ignoresSafeArea()
    }
    
    func login(){
        Auth.auth().signIn(withEmail: username, password: password){ result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
        }
    }
    
    func register(){
        Auth.auth().createUser(withEmail: username, password: password) {
            result, error in if error != nil{
                print(error!.localizedDescription)
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment){
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
    }
}
