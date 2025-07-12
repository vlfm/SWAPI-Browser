import Foundation

public struct Planet: Equatable, Identifiable, Sendable {
    public let climate: String
    public let diameter: Double
    public let films: [Film.ID]
    public let gravity: String
    public let id: Id<Self, URL>
    public let name: String
    public let orbitalPeriod: Double
    public let population: Int64
    public let residents: [Person.ID]
    public let rotationPeriod: Double
    public let surfaceWater: Double
    public let terrain: String

    public init(
        climate: String,
        diameter: Double,
        films: [Film.ID],
        gravity: String,
        id: Id<Self, URL>,
        name: String,
        orbitalPeriod: Double,
        population: Int64,
        residents: [Person.ID],
        rotationPeriod: Double,
        surfaceWater: Double,
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
