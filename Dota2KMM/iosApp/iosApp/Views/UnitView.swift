import SwiftUI

struct UnitView: View {
    @EnvironmentObject private var nav: NavControllerViewModel
    @ObservedObject private var viewModel: UnitViewModel = UnitViewModel()
    
    var unitName: String
    
    var body: some View {
        VStack {
            Text(unitName)
                .font(.title)
        }
        .onAppear {
            viewModel.loadUnitData(name: unitName)
        }        
    }
}

struct UnitView_Previews: PreviewProvider {
    static var previews: some View {
        UnitView(unitName: "name")
    }
}
