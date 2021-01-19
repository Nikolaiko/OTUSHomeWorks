import SwiftUI
import HomeViewModelsPackage
import HomeCorePackage

public struct EpisodesView: View {
    @EnvironmentObject private var model: BBEpisodesViewModel
    
    public var body: some View {
        ZStack {
            VStack(alignment: .center) {
                HStack {
                    Spacer()
                    Text("Breaking bad episodes")
                        .lineLimit(4)                        
                        .foregroundColor(.black)
                    Spacer()
                }
                ScrollView {
                    ForEach(model.chapters) { episode in
                        HStack {
                            Spacer()
                            EpisodeCell(episode: episode)
                            Spacer()
                        }
                        .contentShape(Rectangle())                        
                    }
                }
                Spacer()
            }
            .background(Color.red)
            if model.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                    .scaleEffect(1.5, anchor: .center)
            }
        }
        .background(Color.white)
        .onAppear {
            model.fetchCharacters()
        }
    }
}

public struct ClassesView_Previews: PreviewProvider {
    public static var previews: some View {
        EpisodesView()
    }
}
