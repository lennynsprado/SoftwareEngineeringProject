//
//  ContentView.swift
//  SoftwareEngineeringProject
//
//

import SwiftUI
import Firebase

struct ContentView: View {
    /*-----------------------UI Delegate-----------------------*/
    /*                                                         */
    /*                  UI View Variables                      */
    /*  NOTE: ALL UI VIEW VARIABLES MUST BE DECLARED AS SUCH:  */
    /*         [someReference]_View                            */
    /*  Purpose:   When switching views for now, a soon to be  */
    /*          made Function will change boolean to switch UI */
    /*                                                         */
    /*                                                         */
    @State var UI_View_Controller = true
    @State var TestUI_View = true
    @State var LandingPage_View = false
    @State var Login_View = false
    @State var Registration_View = false
    @State var Home_View = false
    @State var Wallet_View = false
    @State var Settings_View = false
    /*                                                         */
    /*                                                         */
    /*                   UI Switch Functions                   */
    /*                                                         */
    func toggle_TestUI_View_UI(){
        UI_View_Controller = true
        TestUI_View = true
        LandingPage_View = false
        Login_View = false
    }
    func toggle_LandingPage_UI(){
        TestUI_View = false
        LandingPage_View = true
    }
    func toggle_Login_View_UI(){
        TestUI_View = false
        Login_View = true
    }
    func toggle_Home_View_UI(){
        TestUI_View = false
        Home_View = true
    }

    /*                                                         */
    /*                     Database Methods                    */
    /*                                                         */
    /*                                                         */
    /*-------<---END--------UI Delegate--------<---END---------*/
    
    func login(){
        Auth.auth().signIn(withEmail: user_EmailAddress,
                           password: user_Password){
            result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
        }
    }
    /*                                                         */
    func register(){
        Auth.auth().createUser(withEmail: user_EmailAddress,
                               password: user_Password) {
            result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
        }
    }
    /*                                                         */
    /*                                                         */
    /*                                                         */
    /*                                                         */
    /*---------------------------------------------------------*/
    
    /*---------------------Landing Page------------------------*/
    /*                                                         */
    /*      Variables                                          */
    /*                                                         */
    /*      Computed Properties                                */
    /*                                                         */
    /*      Observed Objects                                   */
    /*                                                         */
    /*                                                         */
    /*---------------------------------------------------------*/
    
    /*-----------------------Login View------------------------*/
    /*                                                         */
    /*                  Observed Objects                       */
    /*                                                         */
    @State private var user_FirstName = ""
    @State private var user_LastName = ""
    @State private var user_Name = ""
    @State private var user_CWID = ""
    @State private var user_EmailAddress = ""
    @State private var user_Password = ""
    /*                                                         */
    /*                      Variables                          */
    /*                                                         */
    /*      `           Computed Properties                    */
    /*                                                         */
    /*                      Functions                          */
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    /*                                                         */
    /*                                                         */
    /*                                                         */
    /*                                                         */
    /*                                                         */
    /*-----------<---END---Login View---END--->----------------*/
    
    /*-----------------------Signup View------------------------*/
    /*                                                         */
    /*      Variables                                          */
    /*                                                         */
    /*      Computed Properties                                */
    /*                                                         */
    /*      Observed Objects                                   */
    /*                                                         */
    /*---------------------------------------------------------*/
    
    
    
    
    
    var body: some View {
        ZStack{
            /*-------------------------------------PROGRAM LOGIC-----------------------------------------*/
            
            if UI_View_Controller {
                
                if UI_View_Controller && TestUI_View {
                    List{
                        Toggle("Landing Page", isOn: $LandingPage_View)
                            .toggleStyle(SwitchToggleStyle(tint: .red))
                        
                        Toggle("Login Screen", isOn: $Login_View)
                            .toggleStyle(SwitchToggleStyle(tint: .red))
                        
//                        Toggle("Home View", isOn: $Home_View)
//                            .toggleStyle(SwitchToggleStyle(tint: .red))
//
//                        Toggle("Settings View", isOn: $Settings_View)
//                            .toggleStyle(SwitchToggleStyle(tint: .red))
                    }
                    .padding(50)
                }
                
                if UI_View_Controller && LandingPage_View {
                    Image("Landing Page")
                        .toolbar {
                            ToolbarItem(placement: .bottomBar) {
                                Button("UITestView") {
                                    toggle_TestUI_View_UI()
                                }
                            }
                        }
                        .background(Color.gray)
                }
                
                if UI_View_Controller && Login_View{
                    Color.black.ignoresSafeArea()
                    
                    VStack{
                        Rectangle()
                            .MakeLoginView_Background_Style()
                    }
                    
                    
                    VStack{
                        
                        Text("MS Scoots")
                            .foregroundColor(.white)
                            .font(.system(size: 70, weight: .bold, design: .rounded))
                        Spacer()
                        
                        VStack{
                            VStack{
                                Image("scooter").animation(.easeIn)
                                
                                TextField("Email Address",text: $user_EmailAddress)
                                    .MakeTextFieldEntry()
                                SecureField("Password",text: $user_Password)
                                    .MakeTextFieldEntry()
                                
                            }
                            VStack{
                                Rectangle()
                                    .Add_Divider()
                                    .padding(15)
                                
                                Button{ login() } label: {
                                    Text("Log In")
                                        .Add_LoginView_ButtonStyle()
                                        .shadow(color: .red, radius: 30)
                                }
                                VStack{
                                    Text("Don't have an account?")
                                        .bold()
                                        .foregroundColor(.white)
                                    
                                    Button{ register() } label: {
                                        Text("Create an Account")
                                            .frame(width: 300,height: 50)
                                            .background(Color.white)
                                            .cornerRadius(10).clipShape(Capsule())
                                    }
                                }
                                
                            }
                            Text("TESTING")
                                .toolbar {
                                    ToolbarItem(placement: .bottomBar) {
                                        Button("UITestView") {
                                            toggle_TestUI_View_UI()
                                        }
                                    }
                                }
                                .background(Color.gray)
                        }
                    }
                }
                
                if UI_View_Controller && Home_View{
                    background(Color.gray)
                    Text("TESTING")
                        .toolbar {
                            ToolbarItem(placement: .bottomBar) {
                                Button("UITestView") {
                                    toggle_TestUI_View_UI()
                                }
                            }
                        }
                        .background(Color.gray)
                
                    Text("Name: \(user_Name)")
                    Text("First Name: \(user_FirstName)")
                    Text("Last Name: \(user_LastName)")
                    
                    Text("CWID: \(user_CWID)")
                    Text("Email: \(user_EmailAddress)")
                    Text("PW: \(user_Password)")
                }
                
                else {
                }
                
            }
        }
    }
}
/*--------------------------->END------PROGRAM LOGIC------END<-------------------------------*/



/*------------------------------------------------------------------------------------*/
/*                                    Custom Styling                                  */
/*------------------------------------------------------------------------------------*/


struct SquareBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: UIScreen.main.bounds.width-50, maxHeight: 200)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(5)
    }
}
extension View {
    func MakeRoundedSquareBackground() -> some View {
        modifier(SquareBackground())
    }
}

struct Divider: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 380, height: 5)
            .foregroundColor(.white)
    }
}

extension View {
    func Add_Divider() -> some View {
        modifier(Divider())
    }
}



struct LoginView_Background_Style: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 1000, height: 300)
            .rotationEffect(.degrees(135))
            .offset(y: -440)
    }
}

extension View {
    func MakeLoginView_Background_Style() -> some View {
        modifier(LoginView_Background_Style())
    }
}

struct TextEntryField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            .frame(width: 350, height: 50, alignment: .center)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .font(.title2)
            .textFieldStyle(.plain)
            .padding(10)
    }
}
extension View {
    func MakeTextFieldEntry() -> some View {
        modifier(TextEntryField())
    }
}


struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
        
            .frame(width: 150, height: 50)
            .background(Color.white)
            .background(RoundedRectangle(cornerRadius: 10,style:.continuous))
            .clipShape(Capsule())
        
            .font(.title2).fontWeight(.bold)
            .foregroundColor(.red)
            .padding(20)
    }
}
extension View {
    func Add_ButtonSytle() -> some View {
        modifier(ButtonStyle())
    }
}

struct LoginView_Login_ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
        
            .frame(width: 150, height: 50)
            .background(
                RoundedRectangle(cornerRadius: 10,style:.continuous)
                    .fill(.white)
            )
            .clipShape(Capsule())
        
            .fontWeight(.bold)
            .foregroundColor(.red)
            .padding(20)
    }
}
extension View {
    func Add_LoginView_ButtonStyle() -> some View {
        modifier(LoginView_Login_ButtonStyle())
    }
}

/*------------------<---END------Custom Styling-------END--->-------------------------*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
