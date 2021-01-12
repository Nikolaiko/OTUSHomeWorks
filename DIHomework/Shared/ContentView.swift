import SwiftUI

struct ContentView: View {
    var body: some View {
        NavControllerView(transition: .custom(.slide)) {
            ClassesView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
