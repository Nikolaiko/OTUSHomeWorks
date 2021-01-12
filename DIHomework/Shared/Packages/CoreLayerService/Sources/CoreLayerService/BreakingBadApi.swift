import Combine
import Foundation

public final class BreakingBadApi : NetworkService {
    private static let BASE_URL = "https://www.breakingbadapi.com"
    
    public init() {}
    
    public func getAllEpisodes() -> AnyPublisher<BBEpisodes, Error> {
        
        let requestUrl = URL(string: BreakingBadApi.BASE_URL)!
            .appendingPathComponent("api")
            .appendingPathComponent("episodes")
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        
        return URLSession
            .shared
            .dataTaskPublisher(for: request)
            .tryMap { try JSONDecoder().decode(BBEpisodes.self, from: $0.data) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    public func getCharacterByName(name: String) -> AnyPublisher<BBCharacters, Error> {
        let requestUrl = URL(string: BreakingBadApi.BASE_URL)!
            .appendingPathComponent("api")
            .appendingPathComponent("characters")
        
        let queryItems = [URLQueryItem(name: "name", value: name)]
        var urlComps = URLComponents(string: requestUrl.absoluteString)!
        urlComps.queryItems = queryItems
        let result = urlComps.url!
        
        var request = URLRequest(url: result)
        request.httpMethod = "GET"
    
        return URLSession
            .shared
            .dataTaskPublisher(for: request)
            .tryMap {
                print($0.data)
                return try JSONDecoder().decode(BBCharacters.self, from: $0.data)
                
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
