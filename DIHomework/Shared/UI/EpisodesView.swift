import SwiftUI

public struct EpisodesView: View {
    @ObservedObject private var model = EpisodesViewModel()    
    
    public var body: some View {
        ZStack {
            VStack(alignment: .center) {
                HStack {
                    Spacer()
                    Text("Breaking bad episodes")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Spacer()
                }
                ScrollView {
                    ForEach(model.state.chapters) { episode in
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
            if model.state.isLoading {
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
