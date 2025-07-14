import Foundation

public struct Species: Equatable, Identifiable, Sendable {
    public let averageHeight: String
    public let averageLifespan: String
    public let classification: String
    public let designation: String
    public let eyeColors: String
    public let films: [Film.ID]
    public let hairColors: String
    public let homeworld: Planet.ID?
    public let id: Id<Self, URL>
    public let language: String
    public let name: String
    public let people: [Person.ID]
    public let skinColors: String

    public init(
        averageHeight: String,
        averageLifespan: String,
        classification: String,
        designation: String,
        eyeColors: String,
        films: [Film.ID],
        hairColors: String,
        homeworld: Planet.ID?,
        id: Id<Self, URL>,
        language: String,
        name: String,
        people: [Person.ID],
        skinColors: String
    ) {
        self.averageHeight = averageHeight
        self.averageLifespan = averageLifespan
        self.classification = classification
        self.designation = designation
        self.eyeColors = eyeColors
        self.films = films
        self.hairColors = hairColors
        self.homeworld = homeworld
        self.id = id
        self.language = language
        self.name = name
        self.people = people
        self.skinColors = skinColors
    }
}
