import SwiftUI
import Combine
import CoreServices

public final class ClassCardsViewModel : ObservableObject {
    
    struct State {
        var cards: [String] = []
        var isLoading = true
        var errorMessage = ""
    }
    
    private let networkService = HeartStoneApi()
    @Published private(set) var state = State()
    
    private var subscriptions = Set<AnyCancellable>()
    
    func fetchCardsFor(className: String) {
        state.isLoading = true
        state.errorMessage = ""
        
        networkService.getCardsByClass(playerClass: PlayerClass(rawValue: className)!)
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
                state.errorMessage = "Error loading cards for classes"
        }
    }

    private func onRecieve(_ cards: Cards) {
        //state.cards = info.classes ?? []
        //state.errorMessage = ""
        //state.isLoading = false    
    }
}
