import Combine

final class GamesListViewModel: ObservableObject {
    @Published private(set) var items = [String]()
    @Published var selectedTab:String? = nil
    
    init() {
        items.append("Nioh 2")
        items.append("Ghost of Tsusima")
    }
}
