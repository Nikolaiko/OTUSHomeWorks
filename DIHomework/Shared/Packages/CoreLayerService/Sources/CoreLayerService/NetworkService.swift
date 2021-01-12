import Foundation
import Combine

public protocol NetworkService {
    func getAllEpisodes() -> AnyPublisher<BBEpisodes, Error>
    func getCharacterByName(name: String) -> AnyPublisher<BBCharacters, Error>
}
