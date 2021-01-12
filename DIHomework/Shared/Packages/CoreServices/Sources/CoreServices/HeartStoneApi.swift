import Combine
import Foundation

public final class HeartStoneApi : NetworkService {
    private static let BASE_URL = "https://omgvamp-hearthstone-v1.p.rapidapi.com"
    private static let API_KEY_HEADER_NAME = "x-rapidapi-key"
    private static let API_KEY_HEADER_VALUE = "84b40497e9msh6a154e0d4eb53cep124df6jsnb1069d2913b6"
    private static let HOST_HEADER_NAME = "x-rapidapi-host"
    private static let HOST_HEADER_VALUE = "omgvamp-hearthstone-v1.p.rapidapi.com"
    
    public init() {}
    
    public func getGameClasses() -> AnyPublisher<Info, Error> {
        
        let requestUrl = URL(string: HeartStoneApi.BASE_URL)!.appendingPathComponent("info")
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.addValue(HeartStoneApi.API_KEY_HEADER_VALUE, forHTTPHeaderField: HeartStoneApi.API_KEY_HEADER_NAME)
        request.addValue(HeartStoneApi.HOST_HEADER_VALUE, forHTTPHeaderField: HeartStoneApi.HOST_HEADER_NAME)
        request.addValue("true", forHTTPHeaderField: "useQueryString")

        return URLSession
            .shared
            .dataTaskPublisher(for: request)
            .tryMap { try JSONDecoder().decode(Info.self, from: $0.data) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    public func getCardsByClass(playerClass: PlayerClass) -> AnyPublisher<Cards, Error> {
        let requestUrl = URL(string: HeartStoneApi.BASE_URL)!
            .appendingPathComponent("cards")
            .appendingPathComponent("classes")
            .appendingPathComponent(playerClass.rawValue)
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.addValue(HeartStoneApi.API_KEY_HEADER_VALUE, forHTTPHeaderField: HeartStoneApi.API_KEY_HEADER_NAME)
        request.addValue(HeartStoneApi.HOST_HEADER_VALUE, forHTTPHeaderField: HeartStoneApi.HOST_HEADER_NAME)
        request.addValue("true", forHTTPHeaderField: "useQueryString")

        return URLSession
            .shared
            .dataTaskPublisher(for: request)
            .tryMap { try JSONDecoder().decode(Cards.self, from: $0.data) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
