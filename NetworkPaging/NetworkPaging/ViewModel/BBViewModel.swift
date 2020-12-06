import Foundation
import Combine

final class BBViewModel: ObservableObject {

    struct State {
        var items: [BBCharacter] = []
        var currentOffset: Int = 0
        var canLoadNextPage = true
    }

    @Published private(set) var state = State()

    private var subscriptions = Set<AnyCancellable>()

    func fetchCharacters() {
        BreakingBadAPI.fetchCharacters(offset: state.currentOffset)            
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

    private func onRecieve(_ posts: BBCharacters) {
        let result = posts as [BBCharacter]
        print(result.count)
        
        state.items += result
        state.currentOffset += BreakingBadAPI.LIMIT
        state.canLoadNextPage = result.count > 0
    }
}
