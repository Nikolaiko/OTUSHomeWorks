import SwiftUI

struct UnitView: View {
    @EnvironmentObject private var nav: NavControllerViewModel
    @ObservedObject private var viewModel: UnitViewModel = UnitViewModel()
    
    var unitName: String
    
    var body: some View {
        VStack {
            Text("Unit name : \(viewModel.unit?.name ?? "Uint name")")
            Text("Description : \(viewModel.unit?.description_ ?? "Unit description")")
                .bold()
                .multilineTextAlignment(.leading)
            Text("Dlc : \(viewModel.unit?.dlcName ?? "Vanila")")
            Text("Era : \(viewModel.unit?.age ?? "Stone")")
            
            Button(action: { nav.pop() }, label: {
                Text("Back")
            })
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
