import Foundation

public struct BBEpisode: Codable {
    public let episodeID: Int?
    public let title, season, airDate: String?
    public let characters: [String]?
    public let episode: String?
    public let series: Series?

    enum CodingKeys: String, CodingKey {
        case episodeID = "episode_id"
        case title, season
        case airDate = "air_date"
        case characters, episode, series
    }
}

public enum Series: String, Codable {
    case betterCallSaul = "Better Call Saul"
    case breakingBad = "Breaking Bad"
}

public typealias BBEpisodes = [BBEpisode]
