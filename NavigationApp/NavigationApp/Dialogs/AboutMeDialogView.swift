import SwiftUI

struct AboutMeDialogView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeDialogView(message: "Test View")
    }
}

struct AboutMeDialogView: View {
    @Environment(\.presentationMode) var presentation
    let message: String

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text(self.message)
                .padding()
                
                Button("Dismiss") {
                    self.presentation.wrappedValue.dismiss()
                }
                .padding()
            }
            .frame(width: geometry.size.width * 0.9,
                   height: geometry.size.height * 0.3,
                   alignment: .center)
            .background(Color.red)
            .cornerRadius(6.0)            
        }
    }
}
