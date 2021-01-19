import SwiftUI
import HomeCorePackage
import HomeServicePackage

@main
struct DIHomeworkApp: App {
    public init() {
        ServiceProvider.shared.addDependancy(dependancy: RealmStorageService() as CacheService)
        ServiceProvider.shared.addDependancy(dependancy: BreakingBadApi(ServiceProvider.shared.getDependancy(type: CacheService.self)!) as NetworkService)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
