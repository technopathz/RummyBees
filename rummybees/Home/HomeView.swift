import SwiftUI

struct HomeView: View {
    @State private var selection = 0
    init() {
        UITabBar.appearance().barTintColor  = Color.lightBackgroundColor.uiColor()
    }
    
    var body: some View {
        TabView(selection: $selection){
            NavigationView {
                Games()
                    
            }
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(0)
            
            
            
            NavigationView {
                ProfileView()
                    
            }
            .font(.system(size: 30, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "person.crop.circle")
                            Text("Profile")
                        }
                        .tag(3)
        }.accentColor(.backgroundColor)
        

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
