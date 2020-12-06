// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let bBCharacters = try? newJSONDecoder().decode(BBCharacters.self, from: jsonData)

import Foundation

// MARK: - BBCharacter
struct BBCharacter: Codable, Identifiable {
    let id: Int?
    let name: String?
    let birthday: String?
    let occupation: [String]?
    let img: String?
    let status: BBStatus?
    let nickname: String?
    let appearance: [Int]?
    let portrayed: String?
    let category: Category?
    let betterCallSaulAppearance: [Int]?

    enum CodingKeys: String, CodingKey {
        case id = "char_id"
        case name, birthday, occupation, img, status, nickname, appearance, portrayed, category
        case betterCallSaulAppearance = "better_call_saul_appearance"
    }
}

enum Birthday: String, Codable {
    case unknown = "Unknown"
}

enum Category: String, Codable {
    case breakingBad = "Breaking Bad"
    case breakingBadBetterCallSaul = "Breaking Bad, Better Call Saul"
}

enum BBStatus: String, Codable {
    case alive = "Alive"
    case deceased = "Deceased"
    case presumeDead = "Presumed dead"
}

typealias BBCharacters = [BBCharacter]

