import Foundation

public struct Film: Equatable, Identifiable, Sendable {
    public let characters: [Person.ID]
    public let director: String
    public let episodeId: Int
    public let id: Id<Self, URL>
    public let openingCrawl: String
    public let planets: [Planet.ID]
    public let producer: String
    public let releaseDate: String
    public let species: [Species.ID]
    public let starships: [Starship.ID]
    public let title: String
    public let vehicles: [Vehicle.ID]

    public init(
        characters: [Person.ID],
        director: String,
        episodeId: Int,
        id: Id<Self, URL>,
        openingCrawl: String,
        planets: [Planet.ID],
        producer: String,
        releaseDate: String,
        species: [Species.ID],
        starships: [Starship.ID],
        title: String,
        vehicles: [Vehicle.ID]
    ) {
        self.characters = characters
        self.director = director
        self.episodeId = episodeId
        self.id = id
        self.openingCrawl = openingCrawl
        self.planets = planets
        self.producer = producer
        self.releaseDate = releaseDate
        self.species = species
        self.starships = starships
        self.title = title
        self.vehicles = vehicles
    }
}
