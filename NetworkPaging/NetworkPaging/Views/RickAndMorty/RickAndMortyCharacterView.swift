import SwiftUI

struct RickAndMortyCharacterView: View {
    let character: Result
    @EnvironmentObject private var navigation: NavControllerViewModel
    
    var body: some View {
        VStack{
            Text("Name : \(character.name ?? "Unknown name")")
            Text("Species : \(character.species ?? "Unknown specie")")
            Button(action: {
                navigation.push(RickAndMortyLocationView(name: character.location?.name ?? "Unknown location"))
            }, label: {
                Text("Last known location")
            })
            Button(action: {
                navigation.pop()
            }, label: {
                Text("Back")
            })
        }
    }
}

struct RickAndMortyCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        //RickAndMortyCharacterView(character: Result())
        EmptyView()
    }
}
