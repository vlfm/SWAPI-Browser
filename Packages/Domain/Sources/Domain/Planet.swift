import Foundation

public struct Planet: Equatable, Identifiable, Sendable {
    public let climate: String
    public let diameter: String
    public let films: [Film.ID]
    public let gravity: String
    public let id: Id<Self, URL>
    public let name: String
    public let orbitalPeriod: String
    public let population: String
    public let residents: [Person.ID]
    public let rotationPeriod: String
    public let surfaceWater: String
    public let terrain: String

    public init(
        climate: String,
        diameter: String,
        films: [Film.ID],
        gravity: String,
        id: Id<Self, URL>,
        name: String,
        orbitalPeriod: String,
        population: String,
        residents: [Person.ID],
        rotationPeriod: String,
        surfaceWater: String,
        terrain: String
    ) {
        self.climate = climate
        self.diameter = diameter
        self.films = films
        self.gravity = gravity
        self.id = id
        self.name = name
        self.orbitalPeriod = orbitalPeriod
        self.population = population
        self.residents = residents
        self.rotationPeriod = rotationPeriod
        self.surfaceWater = surfaceWater
        self.terrain = terrain
    }
}
