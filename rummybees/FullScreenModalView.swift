
import SwiftUI

struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode

        var body: some View {
            Button("Dismiss Modal") {
                presentationMode.wrappedValue.dismiss()
            }
        }}

struct FullScreenModalView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenModalView()
    }
}
