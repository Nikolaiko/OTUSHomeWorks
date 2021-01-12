import SwiftUI
import DataLayer

struct EpisodeCell: View {
    @EnvironmentObject private var navigation: NavControllerViewModel
    
    let episode: EpisodeData
    
    var body: some View {
        VStack {
            Text(episode.title)
                .foregroundColor(Color.black)
                .font(.title)
                .padding(.top, 5)
                .padding(.bottom, 5)
            
            Text("Characters : ")
                .foregroundColor(Color.black)
                .font(.title)
                .padding(.bottom, 5)
            ForEach(episode.characters, id: \.self) { character in
                HStack {
                    Text(character)
                        .bold()
                        .padding(.top, 3)
                        .padding(.bottom, 3)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    navigation.push(CharacterView(characterName: character))
                }
            }
            
            
            Rectangle()
                .frame(height: 2)
                .foregroundColor(Color.white)
        }
    }
}

struct EpisodeCell_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeCell(episode: EpisodeData(id: 1, episodeName: "name", number: "number", season: "Season", characters: ["Walter", "Skyler"]))
    }
}
