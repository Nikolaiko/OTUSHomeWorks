import Foundation

public class ServiceProvider : DependancyLocator {
    fileprivate var services: [String : Any] = [:]
    
    public static let shared = ServiceProvider()
            
    fileprivate init() {}
    
    public func getDependancy<T>(type: T.Type) -> T? {
        return services[String(describing: T.self)] as? T
    }
    
    public func addDependancy<T>(dependancy: T) {
        let typeName = String(describing: T.self)
        if services[typeName] == nil {
            services[typeName] = dependancy
        }
    }
}
