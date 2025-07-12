import Foundation

public struct Root: Codable, Equatable, Sendable {
    public let films: URL
    public let people: URL
    public let planets: URL
    public let species: URL
    public let starships: URL
    public let vehicles: URL

    public init(
        films: URL,
        people: URL,
        planets: URL,
        species: URL,
        starships: URL,
        vehicles: URL
    ) {
        self.films = films
        self.people = people
        self.planets = planets
        self.species = species
        self.starships = starships
        self.vehicles = vehicles
    }
}
