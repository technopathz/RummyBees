

import SwiftUI

struct PresentationButton<Content: View>: View {
    @State var isPresented = false
    private var destinationView: Content
    private var buttonImage: Image
    
    init(@ViewBuilder destinationView:() -> Content, buttonImage:Image) {
        self.destinationView = destinationView()
        self.buttonImage = buttonImage
    }
    
    var body: some View {
        Button(action: {self.$isPresented.wrappedValue = true}) {
            self.buttonImage
        }.fullScreenCover(isPresented: self.$isPresented, content: {
            self.destinationView
        })
        
    }
}

//struct PresentationButton_Previews: PreviewProvider {
//    static var previews: some View {
//        PresentationButton(destinationView: Text(""), buttonContent: Text(""))
//    }
//}
