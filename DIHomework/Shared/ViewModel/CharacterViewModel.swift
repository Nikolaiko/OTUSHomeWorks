import SwiftUI
import Combine
import DataLayer
import CoreLayerService

public final class CharacterViewModel : ObservableObject {
    
    struct State {
        var character: CharacterData = CharacterData(characterId: -1, characterName: "", characterImage: "")
        var isLoading = true
        var errorMessage = ""
    }
    
    private let networkService = BreakingBadApi()
    @Published private(set) var state = State()
    
    private var subscriptions = Set<AnyCancellable>()
    
    func fetchCharacter(characterName: String) {
        state.isLoading = true
        state.errorMessage = ""
        
        networkService.getCharacterByName(name: characterName)
            .map({ (characters) -> CharacterData in
                if let char = characters.first {
                    return CharacterData(
                        characterId: char.charID ?? -1,
                        characterName: char.name ?? "",
                        characterImage: char.img ?? ""
                    )
                } else {
                    return CharacterData(characterId: -1, characterName: "", characterImage: "")
                }
            })
            .mapError({ error in
                print(error)
                return error
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
                print("Error")
                state.errorMessage = "Error loading character"
        }
    }

    private func onRecieve(_ character: CharacterData) {
        print(character)
        state.character = character
        state.errorMessage = ""
        state.isLoading = false
    }
}
