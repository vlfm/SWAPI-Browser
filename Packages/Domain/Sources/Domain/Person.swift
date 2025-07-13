import Foundation

public struct Person: Equatable, Identifiable, Sendable {
    public let birthYear: String
    public let eyeColor: String
    public let films: [Film.ID]
    public let gender: String
    public let hairColor: String
    public let height: String
    public let homeworld: Planet.ID
    public let id: Id<Self, URL>
    public let mass: String
    public let name: String
    public let skinColor: String
    public let species: [Species.ID]
    public let starships: [Starship.ID]
    public let vehicles: [Vehicle.ID]

    public init(
        birthYear: String,
        eyeColor: String,
        films: [Film.ID],
        gender: String,
        hairColor: String,
        height: String,
        homeworld: Planet.ID,
        id: Id<Self, URL>,
        mass: String,
        name: String,
        skinColor: String,
        species: [Species.ID],
        starships: [Starship.ID],
        vehicles: [Vehicle.ID]
    ) {
        self.birthYear = birthYear
        self.eyeColor = eyeColor
        self.films = films
        self.gender = gender
        self.hairColor = hairColor
        self.height = height
        self.homeworld = homeworld
        self.id = id
        self.mass = mass
        self.name = name
        self.skinColor = skinColor
        self.species = species
        self.starships = starships
        self.vehicles = vehicles
    }
}
