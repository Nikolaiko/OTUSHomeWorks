import Foundation
import RealmSwift

public struct RealmStorageService : CacheService {
    private static let REALM_FILE_NAME = "BreakingBad.realm"
    
    private let realmInstance: Realm
    
    public init() {
        let fileURL = try! FileManager.default
            .url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent(RealmStorageService.REALM_FILE_NAME)
        
        var config = Realm.Configuration()
        config.fileURL = fileURL
        
        realmInstance = try! Realm(configuration: config)
    }
    
    public func getCacheForUrl(urlString: String) -> Data? {
        var response: Data? = nil
        print("Getting")
        DispatchQueue(label: "background").sync {
            if let data = realmInstance.object(ofType: RealmRequestCache.self, forPrimaryKey: urlString) {
                response = data.response
            }
        }
        return response
    }
    
    public func saveCacheForUrl(urlString: String, responseString: Data) {
        print("Saving")
        DispatchQueue.main.async {
            autoreleasepool {
                let cache = RealmRequestCache(urlString, responseString)
                try! realmInstance.write {
                    realmInstance.add(cache)
                }
            }
        }
    }
}
