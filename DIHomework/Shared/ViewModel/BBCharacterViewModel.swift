import SwiftUI
import Combine
import DataLayer
import CoreLayerService

public final class BBCharacterViewModel : ObservableObject {
                
    @Published private(set) public var character: CharacterData = CharacterData(characterId: -1, characterName: "", characterImage: "")
    @Published private(set) public var isLoading = true
    @Published private(set) public var errorMessage = ""
        
    private var subscriptions = Set<AnyCancellable>()
    
    private let networkService: NetworkService
    
    public init(_ service: NetworkService) {
        networkService = service
    }
    
    func fetchCharacter(characterName: String) {
        isLoading = true
        errorMessage = ""
        
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
                return error
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
                print("Error")
                errorMessage = "Error loading character"
        }
    }

    private func onRecieve(_ loadedCharacter: CharacterData) {
        character = loadedCharacter
        errorMessage = ""
        isLoading = false
    }
}
