import SwiftUI
import Combine
import CoreLayerService
import DataLayer

public final class EpisodesViewModel : ObservableObject {
    
    struct State {
        var chapters: [EpisodeData] = []
        var isLoading = true
        var errorMessage = ""
    }
    
    private let networkService = BreakingBadApi()
    @Published private(set) var state = State()
    
    private var subscriptions = Set<AnyCancellable>()
    
    func fetchCharacters() {
        state.isLoading = true
        state.errorMessage = ""
        
        networkService.getAllEpisodes()
            .map({ (episodes) -> [EpisodeData] in
                var episodesData: [EpisodeData] = []
                for episode: BBEpisode in episodes {
                    episodesData.append(
                        EpisodeData(
                            id: episode.episodeID ?? -1,
                            episodeName: episode.title ?? "",
                            number: episode.episode ?? "0",
                            season: episode.season ?? "0",
                            characters: episode.characters ?? []
                        )
                    )
                }
                return episodesData
            })
            .sink(receiveCompletion: onRecieve,
                  receiveValue: onRecieve)
            .store(in: &subscriptions)
    }
    
    private func onRecieve(_ completion: Subscribers.Completion<Error>) {
        state.isLoading = false
        
        switch completion {
            case .finished:
                state.errorMessage = ""
                break
            case .failure:
                state.errorMessage = "Error loading episodes info"
        }
    }

    private func onRecieve(_ episodes: [EpisodeData]) {        
        state.chapters = episodes
        state.errorMessage = ""
        state.isLoading = false
    }
}
