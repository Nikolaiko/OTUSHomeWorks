import SwiftUI

struct ContentView: View {
    @State private var selectedFrame = 0
    
    var body: some View {
        NavControllerView(transition: .custom(.slide)) {
            VStack {
                Picker(selection: $selectedFrame, label: Text("What is your favorite serial?")) {
                    Text("Ricky and Morty").tag(0)
                    Text("Breaking bad").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                
                if selectedFrame == 0 {
                    RickAndMortyView()
                } else {
                    BreakingBadView()
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
