import SwiftUI
import CoreLayerService

@main
struct DIHomeworkApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    ServiceProvider.shared.addDependancy(dependancy: BreakingBadApi() as NetworkService)
                }
        }
    }
}
