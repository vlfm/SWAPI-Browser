import Domain
import Foundation
import Testing

@testable import ApiService

struct PersonTests {
    @Test
    func initWithDto() throws {
        let data = try #require(try Bundle.module.jsonData(forResource: "Person"))
        let dto = try JSONDecoder().decode(PersonDto.self, from: data)
        let person = Person(dto: dto)
        let expectedPerson = Person(
            birthYear: "19BBY",
            eyeColor: "blue",
            films: [
                Film.ID(URL(string: "https://swapi.info/api/films/1")!),
                Film.ID(URL(string: "https://swapi.info/api/films/2")!),
                Film.ID(URL(string: "https://swapi.info/api/films/3")!),
                Film.ID(URL(string: "https://swapi.info/api/films/6")!)
            ],
            gender: "male",
            hairColor: "blond",
            height: "172",
            homeworld: Planet.ID(URL(string: "https://swapi.info/api/planets/1")!),
            id: Person.ID(URL(string: "https://swapi.info/api/people/1")!),
            mass: "77",
            name: "Luke Skywalker",
            skinColor: "fair",
            species: [],
            starships: [
                Starship.ID(URL(string: "https://swapi.info/api/starships/12")!),
                Starship.ID(URL(string: "https://swapi.info/api/starships/22")!)
            ],
            vehicles: [
                Vehicle.ID(URL(string: "https://swapi.info/api/vehicles/14")!),
                Vehicle.ID(URL(string: "https://swapi.info/api/vehicles/30")!)
            ]
        )

        #expect(person == expectedPerson)
    }
}
