import SwiftUI

struct ContentView: View {
    @State private var selectedFrame = 0

        var body: some View {
            VStack {
                Picker(selection: $selectedFrame, label: Text("What is your favorite serial?")) {
                    Text("Ricky and Morty").tag(0)
                    Text("Breaking bad").tag(1)                    
                }.pickerStyle(SegmentedPickerStyle())

                Text("Value: \(selectedFrame)")
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
