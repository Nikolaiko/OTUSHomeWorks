import Foundation
import RealmSwift

class RealmRequestCache: Object {
    @objc dynamic var url = ""
    @objc dynamic var response = Data()
        
    override static func primaryKey() -> String? {
        return "url"
    }
    
    public override init() {}
    
    public init(_ url: String,
                _ response: Data) {
        self.url = url
        self.response = response
    }
}
