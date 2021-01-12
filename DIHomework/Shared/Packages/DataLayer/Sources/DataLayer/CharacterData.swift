public struct CharacterData {
    public let id: Int
    public let name: String
    public let image: String
    
    public init(characterId: Int, characterName: String, characterImage: String) {
        id = characterId
        name = characterName
        image = characterImage
    }
}
