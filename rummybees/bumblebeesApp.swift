import SwiftUI

@main
struct bumblebeesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().onAppear(perform: {
                usersShared.saveList(list: fetchData())
            })
        }
    }
}
