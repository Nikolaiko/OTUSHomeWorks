import SwiftUI
import SDWebImageSwiftUI

struct CharacterView: View {
    let characterName: String
    
    @EnvironmentObject private var navigation: NavControllerViewModel
    @EnvironmentObject private var model: BBCharacterViewModel
    
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
                if model.character.image != "" {
                    WebImage(url: URL(string: model.character.image))
                        .resizable()
                        .placeholder {
                            Rectangle().foregroundColor(.gray)
                        }
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                }
                Button(action: { navigation.pop() }, label: {
                    Text("Back")
                })
                Spacer()
            }
            .background(Color.red)
            if model.isLoading {
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
