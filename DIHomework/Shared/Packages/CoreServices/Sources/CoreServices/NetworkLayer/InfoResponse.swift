import Foundation

public struct Info: Codable {
    public let patch: String?
    public let classes, sets, standard, wild: [String]?
    public let types, factions, qualities, races: [String]?
    public let locales: Locales?
}

public struct Locales: Codable {
    let deDe, enGB, enUs, esEs: String?
    let esMX, frFr, itIt, koKr: String?
    let plPl, ptBr, ruRu, zhCN: String?
    let zhTw, jaJp, thTh: String?

    public enum CodingKeys: String, CodingKey {
        case deDe = "DE_DE"
        case enGB = "EN_GB"
        case enUs = "EN_US"
        case esEs = "ES_ES"
        case esMX = "ES_MX"
        case frFr = "FR_FR"
        case itIt = "IT_IT"
        case koKr = "KO_KR"
        case plPl = "PL_PL"
        case ptBr = "PT_BR"
        case ruRu = "RU_RU"
        case zhCN = "ZH_CN"
        case zhTw = "ZH_TW"
        case jaJp = "JA_JP"
        case thTh = "TH_TH"
    }
}
