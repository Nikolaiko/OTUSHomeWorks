import Foundation
import shared

class UnitViewModel : ObservableObject, UnitDelegate {
    private var repository = UnitRepository()
    
    @Published var unit: CivUnit? = nil
    
    init() {
        repository.attachDelegate(view: self)
    }
    
    func loadUnitData(name: String) {
        repository.loadUnitData(name: name)
    }
    
    func setUnitData(unitData: CivUnit) {
        unit = unitData
    }
}
