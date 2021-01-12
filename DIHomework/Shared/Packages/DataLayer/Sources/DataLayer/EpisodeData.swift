public struct EpisodeData : Identifiable {
    public var id: Int
    public let title: String
    public let episodeNumber: String
    public let episodeSeason: String
    public let characters: [String]
    
    public init(id: Int, episodeName: String, number: String, season: String, characters: [String]) {
        self.id = id
        self.characters = characters
        
        title = episodeName
        episodeNumber = number
        episodeSeason = season
    }
}
