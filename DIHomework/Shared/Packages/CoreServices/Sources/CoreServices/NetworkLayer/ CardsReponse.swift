// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cards = try? newJSONDecoder().decode(Cards.self, from: jsonData)

import Foundation

// MARK: - Card
public struct Card: Codable {
    public let cardID, dbfID, name: String?
    public let cardSet: CardSet?
    public let type: TypeEnum?
    public let text: String?
    public let playerClass: PlayerClass?
    public let locale: Locale?
    public let rarity: Rarity?
    public let health: Int?
    public let mechanics: [Mechanic]?
    public let faction: Faction?
    public let elite: Bool?
    public let cost, attack: Int?
    public let race: Race?
    public let img: String?
    public let flavor, artist: String?
    public let collectible: Bool?
    public let imgGold: String?
    public let durability: Int?
    public let howToGetGold, howToGet, armor, multiClassGroup: String?
    public let classes: [PlayerClass]?

    public enum CodingKeys: String, CodingKey {
        case cardID = "cardId"
        case dbfID = "dbfId"
        case name, cardSet, type, text, playerClass, locale, rarity, health, mechanics, faction, elite, cost, attack, race, img, flavor, artist, collectible, imgGold, durability, howToGetGold, howToGet, armor, multiClassGroup, classes
    }
}

public enum CardSet: String, Codable {
    case ashesOfOutland = "Ashes of Outland"
    case basic = "Basic"
    case battlegrounds = "Battlegrounds"
    case blackrockMountain = "Blackrock Mountain"
    case classic = "Classic"
    case credits = "Credits"
    case demonHunterInitiate = "Demon Hunter Initiate"
    case descentOfDragons = "Descent of Dragons"
    case galakrondSAwakening = "Galakrond's Awakening"
    case goblinsVsGnomes = "Goblins vs Gnomes"
    case hallOfFame = "Hall of Fame"
    case heroSkins = "Hero Skins"
    case journeyToUnGoro = "Journey to Un'Goro"
    case knightsOfTheFrozenThrone = "Knights of the Frozen Throne"
    case koboldsCatacombs = "Kobolds & Catacombs"
    case madnessAtTheDarkmoonFaire = "Madness At The Darkmoon Faire"
    case meanStreetsOfGadgetzan = "Mean Streets of Gadgetzan"
    case missions = "Missions"
    case naxxramas = "Naxxramas"
    case oneNightInKarazhan = "One Night in Karazhan"
    case rastakhanSRumble = "Rastakhan's Rumble"
    case riseOfShadows = "Rise of Shadows"
    case saviorsOfUldum = "Saviors of Uldum"
    case scholomanceAcademy = "Scholomance Academy"
    case tavernBrawl = "Tavern Brawl"
    case tavernsOfTime = "Taverns of Time"
    case theBoomsdayProject = "The Boomsday Project"
    case theGrandTournament = "The Grand Tournament"
    case theLeagueOfExplorers = "The League of Explorers"
    case theWitchwood = "The Witchwood"
    case whispersOfTheOldGods = "Whispers of the Old Gods"
    case wildEvent = "Wild Event"
}

public enum PlayerClass: String, Codable {
    case deathKnight = "Death Knight"
    case demonHunter = "Demon Hunter"
    case dream = "Dream"
    case druid = "Druid"
    case hunter = "Hunter"
    case mage = "Mage"
    case neutral = "Neutral"
    case paladin = "Paladin"
    case priest = "Priest"
    case rogue = "Rogue"
    case shaman = "Shaman"
    case warlock = "Warlock"
    case warrior = "Warrior"
    case whizbang = "Whizbang"
}

public enum Faction: String, Codable {
    case alliance = "Alliance"
    case horde = "Horde"
    case neutral = "Neutral"
}

public enum Locale: String, Codable {
    case enUS = "enUS"
}

// MARK: - Mechanic
public struct Mechanic: Codable {
    public let name: Name?
}

public enum Name: String, Codable {
    case adapt = "Adapt"
    case adjacentBuff = "AdjacentBuff"
    case affectedBySpellPower = "AffectedBySpellPower"
    case aiMustPlay = "AIMustPlay"
    case aura = "Aura"
    case battlecry = "Battlecry"
    case castsWhenDrawn = "Casts When Drawn"
    case charge = "Charge"
    case combo = "Combo"
    case corrupt = "Corrupt"
    case deathrattle = "Deathrattle"
    case discover = "Discover"
    case divineShield = "Divine Shield"
    case echo = "Echo"
    case freeze = "Freeze"
    case immuneToSpellpower = "ImmuneToSpellpower"
    case inspire = "Inspire"
    case invisibleDeathrattle = "InvisibleDeathrattle"
    case invoke = "Invoke"
    case jadeGolem = "Jade Golem"
    case lifesteal = "Lifesteal"
    case magnetic = "Magnetic"
    case morph = "Morph"
    case oneTurnEffect = "OneTurnEffect"
    case outcast = "Outcast"
    case overkill = "Overkill"
    case overload = "Overload"
    case poisonous = "Poisonous"
    case quest = "Quest"
    case reborn = "Reborn"
    case recruit = "Recruit"
    case rush = "Rush"
    case secret = "Secret"
    case sidequest = "Sidequest"
    case silence = "Silence"
    case spellDamage = "Spell Damage"
    case spellburst = "Spellburst"
    case stealth = "Stealth"
    case summoned = "Summoned"
    case taunt = "Taunt"
    case twinspell = "Twinspell"
    case windfury = "Windfury"
}

public enum Race: String, Codable {
    case all = "All"
    case beast = "Beast"
    case demon = "Demon"
    case dragon = "Dragon"
    case elemental = "Elemental"
    case mech = "Mech"
    case murloc = "Murloc"
    case pirate = "Pirate"
    case totem = "Totem"
}

public enum Rarity: String, Codable {
    case common = "Common"
    case epic = "Epic"
    case free = "Free"
    case legendary = "Legendary"
    case rare = "Rare"
}

public enum TypeEnum: String, Codable {
    case enchantment = "Enchantment"
    case hero = "Hero"
    case heroPower = "Hero Power"
    case minion = "Minion"
    case spell = "Spell"
    case weapon = "Weapon"
}

public typealias Cards = [Card]
