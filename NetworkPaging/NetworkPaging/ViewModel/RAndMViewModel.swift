import Foundation
import Combine

final class RAndMVeiwModel: ObservableObject {

    struct State {
        var items: [Result] = []
        var nextPage: String? = nil
        var canLoadNextPage = true
    }

    @Published private(set) var state = State()

    private var subscriptions = Set<AnyCancellable>()

    func fetchCharacters() {
        RAndMortyAPI.fetchCharacters(urlString: state.nextPage ?? RAndMortyAPI.baseCharactersString)            
            .sink(receiveCompletion: onRecieve,
                  receiveValue: onRecieve)
            .store(in: &subscriptions)
    }
    
    private func onRecieve(_ completion: Subscribers.Completion<Error>) {
        switch completion {
            case .finished:                
                break
            case .failure:
                state.canLoadNextPage = false
        }
    }

    private func onRecieve(_ posts: Characters) {        
        state.items += posts.results ?? []
        state.nextPage = posts.info?.next
        state.canLoadNextPage = state.nextPage != nil
    }
}
