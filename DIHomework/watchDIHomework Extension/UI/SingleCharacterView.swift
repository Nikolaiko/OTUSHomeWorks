import SwiftUI

struct CharacterView: View {
    let characterName: String
    
    var body: some View {
        Text("")
    }
}

struct SingleCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(characterName: "Walter")
    }
}
