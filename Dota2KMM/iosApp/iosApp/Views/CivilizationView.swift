import SwiftUI
import shared

struct CivilizationView: View {
    @EnvironmentObject private var nav: NavControllerViewModel
    
    let civilization: Civilization
    
    var body: some View {
        HStack{
            Spacer()
            VStack {
                Text(civilization.name)
                    .font(.title)
                    .foregroundColor(.blue)
                
                Text("Expansion : \(civilization.expansion)")
                    .foregroundColor(.blue)
                
                Text("Army type : \(civilization.armyType)")
                    .foregroundColor(.blue)
                                                
                if civilization.uniqueUnit.count > 0 {
                    Text("Uniq units (tapable) : ")
                        .foregroundColor(.blue)
                        .bold()
                    ForEach(civilization.uniqueUnit, id:\.self) { unitName in
                        Text(getNameFromLink(link: unitName))
                            .foregroundColor(.blue)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                nav.push(UnitView(unitName: getNameFromLink(link: unitName)))
                            }
                    }
                }
                Rectangle()
                    .frame(height: 5)
                    .foregroundColor(.red)
            }
            Spacer()
        }
        .background(Color.white)
    }
    
    private func getNameFromLink(link: String) -> String {
        return link.components(separatedBy: "/").last ?? "Not Parsed"
    }
}

struct CivilizationView_Previews: PreviewProvider {
    static var previews: some View {
        CivilizationView(civilization: Civilization(id: 1, name: "", expansion: "", armyType: "", uniqueUnit: [], uniqueTech: [], teamBonus: "", civilizationBonus: []))
    }
}
