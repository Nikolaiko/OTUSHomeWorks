import Foundation
import shared

class CivilizationViewModel : ObservableObject, CivilizationsDelegate {
    private var repository = CivilizationsRepository()
    
    @Published var civilizations: [Civilization] = []
    
    init() {
        repository.attachDelegate(view: self)
    }
    
    func loadCivData() {
        repository.loadCivData()
    }
    
    func setCivilizations(data: Civilizations) {
        civilizations = data.civilizations
    }
}
