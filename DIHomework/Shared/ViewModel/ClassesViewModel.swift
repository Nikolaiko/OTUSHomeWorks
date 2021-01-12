import SwiftUI
import Combine
import CoreServices

public final class ClassesViewModel : ObservableObject {
    
    struct State {
        var classes: [String] = []
        var isLoading = true
        var errorMessage = ""
    }
    
    private let networkService = HeartStoneApi()
    @Published private(set) var state = State()
    
    private var subscriptions = Set<AnyCancellable>()
    
    func fetchCharacters() {
        state.isLoading = true
        state.errorMessage = ""
        
        networkService.getGameClasses()
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
                state.errorMessage = "Error loading classes info"
        }
    }

    private func onRecieve(_ info: Info) {
        state.classes = info.classes ?? []
        state.errorMessage = ""
        state.isLoading = false
    }
}
