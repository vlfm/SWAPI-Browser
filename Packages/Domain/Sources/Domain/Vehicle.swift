import Foundation

public struct Vehicle: Equatable, Identifiable, Sendable {
    public let cargoCapacity: String
    public let consumables: String
    public let costInCredits: String
    public let crew: String
    public let films: [Film.ID]
    public let id: Id<Self, URL>
    public let length: String
    public let manufacturer: String
    public let maxAtmospheringSpeed: String
    public let model: String
    public let name: String
    public let passengers: String
    public let pilots: [Person.ID]
    public let vehicleClass: String

    public init(
        cargoCapacity: String,
        consumables: String,
        costInCredits: String,
        crew: String,
        films: [Film.ID],
        id: Id<Self, URL>,
        length: String,
        manufacturer: String,
        maxAtmospheringSpeed: String,
        model: String,
        name: String,
        passengers: String,
        pilots: [Person.ID],
        vehicleClass: String
    ) {
        self.cargoCapacity = cargoCapacity
        self.consumables = consumables
        self.costInCredits = costInCredits
        self.crew = crew
        self.films = films
        self.id = id
        self.length = length
        self.manufacturer = manufacturer
        self.maxAtmospheringSpeed = maxAtmospheringSpeed
        self.model = model
        self.name = name
        self.passengers = passengers
        self.pilots = pilots
        self.vehicleClass = vehicleClass
    }
}
