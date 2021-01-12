import SwiftUI

struct CharacterView: View {
    let characterName: String
    
    @EnvironmentObject private var navigation: NavControllerViewModel
    @ObservedObject private var model = CharacterViewModel()
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                HStack {
                    Spacer()
                    Text(characterName)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Spacer()
                }
                if model.state.character.image != "" {
                    AsyncImage(url: URL(string: model.state.character.image)!,
                               placeholder: { Text("Loading ...") },
                               image: { Image(uiImage: $0).resizable() }
                    )
                    .frame(idealHeight: UIScreen.main.bounds.width / 2 * 3)
                }
                Button(action: { navigation.pop() }, label: {
                    Text("Back")
                })
                Spacer()
            }
            .background(Color.red)
            if model.state.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                    .scaleEffect(1.5, anchor: .center)
            }
        }
        .onAppear {
            model.fetchCharacter(characterName: characterName)
        }
    }
}

struct SingleCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(characterName: "Walter")
    }
}
