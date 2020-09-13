import SwiftUI

struct NiohScreen_Previews: PreviewProvider {
    static var previews: some View {
        NiohScreen()
    }
}

struct NiohScreen: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Nioh 2")
                    .font(.title)
                //Image("nioh")
                //    .scaledToFit()
            }
            .frame(minWidth: 0.0,
                   maxWidth: geometry.size.width,
                   minHeight: 0.0,
                   maxHeight: geometry.size.height)
        }
        
    }
}
