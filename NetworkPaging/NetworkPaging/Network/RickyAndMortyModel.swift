// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let characters = try? newJSONDecoder().decode(Characters.self, from: jsonData)

import Foundation

// MARK: - Characters
struct Characters: Codable {
    let info: Info?
    let results: [Result]?
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next, prev: String?
}

// MARK: - Result
struct Result: Codable, Identifiable {
    let id: Int?
    let name: String?
    let status: Status?
    let species, type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

struct Location: Codable {
    let id: Int?
    let name, type, dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
