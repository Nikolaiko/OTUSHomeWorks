import Combine
import Foundation

public final class BreakingBadApi : NetworkService {
    private static let BASE_URL = "https://www.breakingbadapi.com"
    
    private let cacheService: CacheService
    
    public init(_ service: CacheService) {
        cacheService = service
    }
    
    public func getAllEpisodes() -> AnyPublisher<BBEpisodes, Error> {
        
        let requestUrl = URL(string: BreakingBadApi.BASE_URL)!
            .appendingPathComponent("api")
            .appendingPathComponent("episodes")
        
        if let cache = cacheService.getCacheForUrl(urlString: requestUrl.absoluteString) {
            return Just( try! JSONDecoder().decode(BBEpisodes.self, from: cache) )
                .mapError { (neverError) -> Error in
                    ParsingError.parsingError
                }
                .eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        
        return URLSession
            .shared
            .dataTaskPublisher(for: request)
            .tryMap {
                self.cacheService.saveCacheForUrl(urlString: requestUrl.absoluteString, responseString: $0.data)
                return try JSONDecoder().decode(BBEpisodes.self, from: $0.data)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    public func getCharacterByName(name: String) -> AnyPublisher<BBCharacters, Error> {
        let requestUrl = URL(string: BreakingBadApi.BASE_URL)!
            .appendingPathComponent("api")
            .appendingPathComponent("characters")
        
        print(name)
        let queryItems = [URLQueryItem(name: "name", value: name)]
        var urlComps = URLComponents(string: requestUrl.absoluteString)!
        urlComps.queryItems = queryItems
        let result = urlComps.url!
                        
        if let cache = cacheService.getCacheForUrl(urlString: result.absoluteString) {
            return Just( try! JSONDecoder().decode(BBCharacters.self, from: cache) )
                .mapError { (neverError) -> Error in
                    ParsingError.parsingError
                }
                .eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: result)
        request.httpMethod = "GET"
        
        return URLSession
            .shared
            .dataTaskPublisher(for: request)
            .tryMap {
                self.cacheService.saveCacheForUrl(urlString: result.absoluteString, responseString: $0.data)
                return try JSONDecoder().decode(BBCharacters.self, from: $0.data)
                
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
