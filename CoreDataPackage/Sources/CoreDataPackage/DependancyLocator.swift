import Foundation

public protocol DependancyLocator {
    func getDependancy<T>(type: T.Type) -> T?
    func addDependancy<T>(dependancy: T)
}

