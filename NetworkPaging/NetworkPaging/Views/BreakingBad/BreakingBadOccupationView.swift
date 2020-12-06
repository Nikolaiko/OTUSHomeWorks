import SwiftUI

struct BreakingBadOccupationView: View {
    let occupation: [String]
    @EnvironmentObject private var navigation: NavControllerViewModel
    
    var body: some View {
        VStack {
            ForEach(occupation, id: \.self) { name in
                Text(name)
            }
            Button(action: {
                navigation.pop()
            }, label: {
                Text("Back")
            })
        }
    }
}

struct BreakingBadOccupationView_Previews: PreviewProvider {
    static var previews: some View {
        BreakingBadOccupationView(occupation: ["Home"])
    }
}
