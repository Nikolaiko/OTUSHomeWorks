import SwiftUI

struct BreakingBadCharacterView: View {
    let character: BBCharacter
    @EnvironmentObject private var navigation: NavControllerViewModel
    
    var body: some View {
        VStack{
            Text("Name : \(character.name ?? "Unknown name")")
            Button(action: {
                navigation.push(BreakingBadOccupationView(occupation: character.occupation ?? ["Unknown location"]))
            }, label: {
                Text("Occupation")
            })
            Button(action: {
                navigation.pop()
            }, label: {
                Text("Back")
            })
        }
    }
}

struct BreakingBadCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
