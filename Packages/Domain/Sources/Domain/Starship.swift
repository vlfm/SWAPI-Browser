import Foundation

public struct Starship: Equatable, Identifiable, Sendable {
    public let cargoCapacity: Double
    public let consumables: String
    public let costInCredits: Double
    public let crew: Int
    public let films: [Film.ID]
    public let hyperdriveRating: String
    public let id: Id<Self, URL>
    public let length: Double
    public let manufacturer: String
    public let maxAtmospheringSpeed: String
    public let maxNumberOfMegalights: Double
    public let model: String
    public let name: String
    public let passengers: Int
    public let pilots: [Person.ID]
    public let starshipClass: String

    public init(
        cargoCapacity: Double,
        consumables: String,
        costInCredits: Double,
        crew: Int,
        films: [Film.ID],
        hyperdriveRating: String,
        id: Id<Self, URL>,
        length: Double,
        manufacturer: String,
        maxAtmospheringSpeed: String,
        maxNumberOfMegalights: Double,
        model: String,
        name: String,
        passengers: Int,
        pilots: [Person.ID],
        starshipClass: String
    ) {
        self.cargoCapacity = cargoCapacity
        self.consumables = consumables
        self.costInCredits = costInCredits
        self.crew = crew
        self.films = films
        self.hyperdriveRating = hyperdriveRating
        self.id = id
        self.length = length
        self.manufacturer = manufacturer
        self.maxAtmospheringSpeed = maxAtmospheringSpeed
        self.maxNumberOfMegalights = maxNumberOfMegalights
        self.model = model
        self.name = name
        self.passengers = passengers
        self.pilots = pilots
        self.starshipClass = starshipClass
    }
}
