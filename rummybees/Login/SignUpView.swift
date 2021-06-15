import SwiftUI

struct SignUpView: View {
    // MARK: - Propertiers
    @ObservedObject private var userViewModel = UserViewModel()
    @State var presentAlert = false
    @State var isActive = false
    
    // MARK: - View
    var body: some View {
        
        
        VStack(alignment: .center, spacing: 15) {
            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.bottom, 50)
            VStack(alignment: .leading, spacing: 15) {
                TextField("User Name", text: $userViewModel.userName)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                Text(userViewModel.usernameMessage).foregroundColor(.red)
                SecureField("Password", text: $userViewModel.password)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                SecureField("Confirm Password", text: $userViewModel.confirmPassword)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                Text(userViewModel.passwordMessage).foregroundColor(.red)
            }.padding([.leading, .trailing], 27.5)
            
            NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true), isActive: self.$isActive) {
                Button(action: {self.signUp()}) {
                    Text("Sign up")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }
                .padding(.top, 50).disabled(!userViewModel.isValid)
            }
            
                
            Spacer()
                
        }
        .background(Color.backgroundColor.edgesIgnoringSafeArea(.all))
                
                
    }
    
    func signUp() {
        var users = fetchData()
        users.append(User(userName: $userViewModel.userName.wrappedValue, password: $userViewModel.password.wrappedValue))
        saveData(users: users)
        UserDefaults.standard.setValue($userViewModel.userName.wrappedValue, forKey: "userName")
        usersShared.saveList(list: users)
        self.$isActive.wrappedValue = true
    }
        
}
    



struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

struct defaultsKeys {
    static let userName = "userName"
    static let password = "password"
}
