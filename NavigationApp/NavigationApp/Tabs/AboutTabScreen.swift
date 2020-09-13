import SwiftUI

struct AboutTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutTabScreen()
    }
}

struct AboutTabScreen: View {
    @State private var showMessage = false
    
    var body: some View {
        Button("About me") {
            self.showMessage = true
        }
        .padding()
        .sheet(
            isPresented: $showMessage,
            content: {
                AboutMeDialogView(message: "My name is Nikolai")
            }
        )
    }
}


