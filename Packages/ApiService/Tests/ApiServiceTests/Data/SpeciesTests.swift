import Domain
import Foundation
import Testing

@testable import ApiService

struct SpeciesTests {
    @Test
    func initWithDto() throws {
        let data = try #require(try Bundle.module.jsonData(forResource: "Species"))
        let dto = try JSONDecoder().decode(SpeciesDto.self, from: data)
        let species = Species(dto: dto)
        let expectedSpecies = Species(
            averageHeight: "210",
            averageLifespan: "400",
            classification: "mammal",
            designation: "sentient",
            eyeColors: "blue, green, yellow, brown, golden, red",
            films: [
                Film.ID(URL(string :"https://swapi.info/api/films/1")!),
                Film.ID(URL(string :"https://swapi.info/api/films/2")!),
                Film.ID(URL(string :"https://swapi.info/api/films/3")!),
                Film.ID(URL(string :"https://swapi.info/api/films/6")!)
            ],
            hairColors: "black, brown",
            homeworld: Planet.ID(URL(string: "https://swapi.info/api/planets/14")!),
            id: Species.ID(URL(string: "https://swapi.info/api/species/3")!),
            language: "Shyriiwook",
            name: "Wookie",
            people: [
                Person.ID(URL(string :"https://swapi.info/api/people/13")!),
                Person.ID(URL(string :"https://swapi.info/api/people/80")!)
            ],
            skinColors: "gray"
        )

        #expect(species == expectedSpecies)
    }
}
