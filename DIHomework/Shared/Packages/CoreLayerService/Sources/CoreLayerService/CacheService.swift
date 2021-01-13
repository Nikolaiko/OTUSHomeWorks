import Foundation

public protocol CacheService {
    func getCacheForUrl(urlString: String) -> Data?
    func saveCacheForUrl(urlString: String, responseString: Data)
}
