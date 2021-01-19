import SwiftUI
import HomeServicePackage
import HomeCorePackage
import HomeViewModelsPackage

struct ContentView: View {
    var body: some View {
        NavControllerView(transition: .custom(.slide)) {
            EpisodesView()
        }
        .environmentObject(BBCharacterViewModel(ServiceProvider.shared.getDependancy(type: NetworkService.self)!))
        .environmentObject(BBEpisodesViewModel(ServiceProvider.shared.getDependancy(type: NetworkService.self)!))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
