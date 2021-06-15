import SwiftUI

struct ProfileView: View {
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isActive  = false
    @State private var showingAlert  = false
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.bottom, 50)
            VStack(alignment: .leading, spacing: 15) {
                
                SecureField("Password", text: $password)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                SecureField("Confirm Password", text: $confirmPassword)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                
            }.padding([.leading, .trailing], 27.5)
            
            NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true), isActive: self.$isActive) {
                Button(action: {self.updatePassword()}) {
                    Text("Update Password")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }
                .padding(.top, 50)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Password Updated"), message: Text(""), dismissButton: .default(Text("Dismiss")))
                }
                
            }
            
                
            Spacer()
                
        }
        .background(Color.backgroundColor.edgesIgnoringSafeArea(.all))
                
    }


    func updatePassword() {
        
        if $password.wrappedValue == $confirmPassword.wrappedValue {
            let userName = UserDefaults.standard.string(forKey: "userName")
            
            var user = usersShared.list.filter{ $0.userName == userName }.first
            if var filteredUser = user {
                user?.password = $password.wrappedValue
                saveData(users: usersShared.list)
                self.$showingAlert.wrappedValue = true
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
