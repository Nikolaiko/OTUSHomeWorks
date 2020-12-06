import SwiftUI

struct RickAndMortyLocationView: View {
    let name: String
    @EnvironmentObject private var navigation: NavControllerViewModel
    
    var body: some View {
        VStack {
            Text("Last known location: \(name)")
            Button(action: {
                navigation.pop()
            }, label: {
                Text("Back")
            })
        }
    }
}

struct RickAndMortyLocationView_Previews: PreviewProvider {
    static var previews: some View {
        RickAndMortyLocationView(name: "Name")
    }
}
