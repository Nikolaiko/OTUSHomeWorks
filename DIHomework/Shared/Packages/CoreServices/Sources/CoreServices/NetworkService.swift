import Foundation
import Combine

public protocol NetworkService {
    func getGameClasses() -> AnyPublisher<Info, Error>
    func getCardsByClass(playerClass: PlayerClass) -> AnyPublisher<Cards, Error>
}
