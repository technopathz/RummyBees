
import SwiftUI

struct Games: View {
    var body: some View {
        VStack(){
            HStack() {
                Spacer()
            }
            VStack(alignment: .center) {
                HStack() {
                    
                    PresentationButton(destinationView: {
                        WorkingInProgess()
                    }, buttonImage: Image("game1"))
                    
                    PresentationButton(destinationView: {
                        WorkingInProgess()
                    }, buttonImage: Image("game2"))
                    
                }
                
                HStack() {
                    PresentationButton(destinationView: {
                        WorkingInProgess()
                    }, buttonImage: Image("game3"))
                    PresentationButton(destinationView: {
                        WorkingInProgess()
                    }, buttonImage: Image("game4"))
                    }
            }
            
            
                Spacer()
            }.background(Color.backgroundColor)
        
        .toolbar(content: {
            
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                
                PresentationButton(destinationView: {
                    WorkingInProgess()
                }, buttonImage: Image("settings"))
                
                PresentationButton(destinationView: {
                    WorkingInProgess()
                }, buttonImage: Image("notifications"))
                
                
                                    }
                                }
            
           
        )
        .navigationBarTitle(Text("Home"), displayMode: .inline)
        .navigationBarColor(Color.lightBackgroundColor.uiColor())
    }
}

//struct Games_Previews: PreviewProvider {
//    static var previews: some View {
//        Games()
//    }
//}
