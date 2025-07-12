import Domain
import Foundation
import Testing

@testable import ApiService

struct PlanetTests {
    @Test
    func initWithDto() throws {
        let data = try #require(try Bundle.module.jsonData(forResource: "Planet"))
        let dto = try JSONDecoder().decode(PlanetDto.self, from: data)
        let planet = try Planet(dto: dto)
        let expectedPlanet = Planet(
            climate: "arid",
            diameter: 10465,
            films: [
                Film.ID(URL(string: "https://swapi.info/api/films/1")!),
                Film.ID(URL(string: "https://swapi.info/api/films/3")!),
                Film.ID(URL(string: "https://swapi.info/api/films/4")!),
                Film.ID(URL(string: "https://swapi.info/api/films/5")!),
                Film.ID(URL(string: "https://swapi.info/api/films/6")!)
            ],
            gravity: "1 standard",
            id: Planet.ID(URL(string: "https://swapi.info/api/planets/1")!),
            name: "Tatooine",
            orbitalPeriod: 304,
            population: 200000,
            residents: [
                Person.ID(URL(string: "https://swapi.info/api/people/1")!),
                Person.ID(URL(string: "https://swapi.info/api/people/2")!),
                Person.ID(URL(string: "https://swapi.info/api/people/4")!),
                Person.ID(URL(string: "https://swapi.info/api/people/6")!),
                Person.ID(URL(string: "https://swapi.info/api/people/7")!),
                Person.ID(URL(string: "https://swapi.info/api/people/8")!),
                Person.ID(URL(string: "https://swapi.info/api/people/9")!),
                Person.ID(URL(string: "https://swapi.info/api/people/11")!),
                Person.ID(URL(string: "https://swapi.info/api/people/43")!),
                Person.ID(URL(string: "https://swapi.info/api/people/62")!)
            ],
            rotationPeriod: 23,
            surfaceWater: 1,
            terrain: "desert"
        )

        #expect(planet == expectedPlanet)
    }
}
