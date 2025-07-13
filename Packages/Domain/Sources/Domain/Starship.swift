import Foundation

public struct Starship: Equatable, Identifiable, Sendable {
    public let cargoCapacity: String
    public let consumables: String
    public let costInCredits: String
    public let crew: String
    public let films: [Film.ID]
    public let hyperdriveRating: String
    public let id: Id<Self, URL>
    public let length: String
    public let manufacturer: String
    public let maxAtmospheringSpeed: String
    public let maxNumberOfMegalights: String
    public let model: String
    public let name: String
    public let passengers: String
    public let pilots: [Person.ID]
    public let starshipClass: String

    public init(
        cargoCapacity: String,
        consumables: String,
        costInCredits: String,
        crew: String,
        films: [Film.ID],
        hyperdriveRating: String,
        id: Id<Self, URL>,
        length: String,
        manufacturer: String,
        maxAtmospheringSpeed: String,
        maxNumberOfMegalights: String,
        model: String,
        name: String,
        passengers: String,
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
