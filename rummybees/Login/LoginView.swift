import SwiftUI

struct LoginView: View {
    // MARK: - Propertiers
    @State private var userName = ""
    @State private var password = ""
    
    @State private var isActive  = false
    
    // MARK: - View
    var body: some View {
        NavigationView{
            VStack() {
                
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 50)
                
                VStack(alignment: .leading, spacing: 15) {
                    TextField("User Name", text: $userName)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                    
                    SecureField("Password", text: $password)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding([.leading, .trailing], 27.5)
                
                
                    Button(action: { self.login()
                        
                    }) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.white)
                            .cornerRadius(15.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                    } .fullScreenCover(isPresented: $isActive) {
                        HomeView().navigationBarBackButtonHidden(true)
                        
                    }
                    .padding(.top, 50)
                
                
                
                
                Spacer()
                HStack(spacing: 0) {
                    Text("Don't have an account? ").foregroundColor(.white)
                        .fontWeight(.bold)
                    NavigationLink(destination: SignUpView().navigationBarBackButtonHidden(true)) {
                            Text("Sign Up")
                                .fontWeight(.bold)
                                .foregroundColor(.white)

                    }
                    
                }
            }
            .background(
                Color.backgroundColor.edgesIgnoringSafeArea(.all))
        }
        
    }
    
    func login() {
        //self.$isActive.wrappedValue = true
        print(self.$userName.wrappedValue)
        print(self.$password.wrappedValue)
        if self.$userName.wrappedValue == "reviewtest" && self.$password.wrappedValue == "Password123!" {
            UserDefaults.standard.setValue("reviewtest", forKey: "userName")
            self.$isActive.wrappedValue = true
        } else {
            let user = usersShared.list.filter{ $0.userName == self.$userName.wrappedValue && $0.password == self.$password.wrappedValue}.first
            if let filteredUser = user,  filteredUser.userName == self.$userName.wrappedValue && filteredUser.password == self.$password.wrappedValue {
                UserDefaults.standard.setValue(filteredUser.userName, forKey: "userName")
                self.$isActive.wrappedValue = true
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension Color {
    static var backgroundColor: Color {
        return Color(red: 191 / 255, green: 89 / 255, blue: 204 / 255)
    }
    static var lightBackgroundColor: Color {
        return Color(red: 235 / 255, green: 152 / 255, blue: 232 / 255)
    }
    static var themeTextField: Color {
        return Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
    }
    
    func uiColor() -> UIColor {
            if #available(iOS 14.0, *) {
                return UIColor(self)
            }

            let scanner = Scanner(string: description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
            var hexNumber: UInt64 = 0
            var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0

            let result = scanner.scanHexInt64(&hexNumber)
            if result {
                r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000FF) / 255
            }
            return UIColor(red: r, green: g, blue: b, alpha: a)
        }
}
