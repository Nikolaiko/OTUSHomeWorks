import Foundation
import Combine

enum RAndMortyAPI {
    static let baseCharactersString = "https://rickandmortyapi.com/api/character"
    
    
    static func fetchCharacters(urlString: String) -> AnyPublisher<Characters, Error> {
        let url = URL(string: urlString)!
                
        return URLSession.shared
            .dataTaskPublisher(for: url)            
            .tryMap { try JSONDecoder().decode(Characters.self, from: $0.data)}
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

enum BreakingBadAPI {
    static let LIMIT: Int = 20    
    
    static let baseCharactersString = "https://www.breakingbadapi.com/api/characters"
    
    static func fetchCharacters(offset: Int) -> AnyPublisher<BBCharacters, Error> {
        var url = URL(string: baseCharactersString)!
        
        var params = [String: Any]()
        params["limit"] = LIMIT
        params["offset"] = offset
        
        url = url.appendingQueryParameters(params)
                
        return URLSession.shared
            .dataTaskPublisher(for: url)            
            .tryMap { try JSONDecoder().decode(BBCharacters.self, from: $0.data)}
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
