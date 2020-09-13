import SwiftUI

struct FirstTab_Previews: PreviewProvider {
   @State static private var selection = 0
    
    static var previews: some View {
        FirstTab(tabSelection: $selection)
    }
}

struct FirstTab: View {
    @Binding var tabSelection: Int
    @EnvironmentObject var secondTabViewModel: GamesListViewModel
    
    var body: some View {
        VStack {
            Button("Open Nioh") {
                self.tabSelection = 1
                self.secondTabViewModel.selectedTab = "Nioh"
            }
            .padding()
            
            Button("Open Doom") {
                self.tabSelection = 1
                self.secondTabViewModel.selectedTab = "Doom"
            }
            .padding()
        }
    }
}
