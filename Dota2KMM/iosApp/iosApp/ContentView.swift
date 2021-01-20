import SwiftUI
import shared

struct ContentView: View {
    @ObservedObject private var viewModel = CivilizationViewModel()
    
    var body: some View {
        NavControllerView(transition: .custom(.slide)) {
            ScrollView {
                ForEach(viewModel.civilizations, id:\.id) { item in
                    CivilizationView(civilization: item)
                }
                .listRowBackground(Color.white)
                .onAppear {
                    viewModel.loadCivData()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
