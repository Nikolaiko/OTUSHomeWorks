import SwiftUI

struct ClassCardsView: View {
    @ObservedObject private var model = ClassCardsViewModel()
    
    let selectedClass: String
    
    var body: some View {
        Text("")
            .onAppear {
                model.fetchCardsFor(className: selectedClass)
            }
    }
}

struct ClassCardsView_Previews: PreviewProvider {
    static var previews: some View {
        ClassCardsView(selectedClass: "Demon Hunter")
    }
}
