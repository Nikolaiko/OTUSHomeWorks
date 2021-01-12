// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let bBCharacter = try? newJSONDecoder().decode(BBCharacter.self, from: jsonData)

import Foundation

// MARK: - BBCharacterElement
public struct BBCharacterElement: Codable {
    public let charID: Int?
    public let name, birthday: String?
    public let occupation: [String]?
    public let img: String?
    public let status, nickname: String?
    public let appearance: [Int]?
    public let portrayed, category: String?

    public enum CodingKeys: String, CodingKey {
        case charID = "char_id"
        case name, birthday, occupation, img, status, nickname, appearance, portrayed, category
    }
}

public typealias BBCharacters = [BBCharacterElement]
