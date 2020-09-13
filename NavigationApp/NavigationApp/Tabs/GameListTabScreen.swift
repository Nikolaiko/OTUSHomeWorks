import SwiftUI

struct GameListTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameListTabScreen()
    }
}

struct GameListTabScreen: View {
    @EnvironmentObject var viewModel: GamesListViewModel
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: NiohScreen(),
                               tag: "Nioh",
                               selection: $viewModel.selectedTab)
                {
                    Text("Nioh 2")
                }
                NavigationLink(destination: DoomScreen(),
                               tag: "Doom",
                               selection: $viewModel.selectedTab)
                {
                    Text("Doom 2")
                }
            }
        }
    }
}

