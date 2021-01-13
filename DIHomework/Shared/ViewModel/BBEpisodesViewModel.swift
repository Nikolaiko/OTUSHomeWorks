import SwiftUI
import Combine
import CoreLayerService
import DataLayer

public final class BBEpisodesViewModel : ObservableObject {
    
    @Published private(set) public var chapters: [EpisodeData] = []
    @Published private(set) public var isLoading = true
    @Published private(set) public var errorMessage = ""
    
    private var subscriptions = Set<AnyCancellable>()
    private let networkService: NetworkService
    
    public init(_ service: NetworkService) {
        networkService = service
    }
    
    func fetchCharacters() {
        isLoading = true
        errorMessage = ""
        
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
        isLoading = false
        
        switch completion {
            case .finished:
                errorMessage = ""
                break
            case .failure:
                errorMessage = "Error loading episodes info"
        }
    }

    private func onRecieve(_ episodes: [EpisodeData]) {        
        chapters = episodes
        errorMessage = ""
        isLoading = false
    }
}
