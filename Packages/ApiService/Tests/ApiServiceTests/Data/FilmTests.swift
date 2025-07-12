import Domain
import Foundation
import Testing
import TestUtils

@testable import ApiService

struct FilmTests {
    @Test
    func initWithDto() throws {
        let data = try #require(try Bundle.module.jsonData(forResource: "Film"))
        let dto = try JSONDecoder().decode(FilmDto.self, from: data)
        let dateParser = Date.ISO8601FormatStyle().year().month().day()
        let film = try Film(dto: dto)
        let expectedFilm = Film(
            characters: [
                Person.ID(URL(string: "https://swapi.info/api/people/1")!),
                Person.ID(URL(string: "https://swapi.info/api/people/2")!),
                Person.ID(URL(string: "https://swapi.info/api/people/3")!),
                Person.ID(URL(string: "https://swapi.info/api/people/4")!),
                Person.ID(URL(string: "https://swapi.info/api/people/5")!),
                Person.ID(URL(string: "https://swapi.info/api/people/6")!),
                Person.ID(URL(string: "https://swapi.info/api/people/7")!),
                Person.ID(URL(string: "https://swapi.info/api/people/8")!),
                Person.ID(URL(string: "https://swapi.info/api/people/9")!),
                Person.ID(URL(string: "https://swapi.info/api/people/10")!),
                Person.ID(URL(string: "https://swapi.info/api/people/12")!),
                Person.ID(URL(string: "https://swapi.info/api/people/13")!),
                Person.ID(URL(string: "https://swapi.info/api/people/14")!),
                Person.ID(URL(string: "https://swapi.info/api/people/15")!),
                Person.ID(URL(string: "https://swapi.info/api/people/16")!),
                Person.ID(URL(string: "https://swapi.info/api/people/18")!),
                Person.ID(URL(string: "https://swapi.info/api/people/19")!),
                Person.ID(URL(string: "https://swapi.info/api/people/81")!)
            ],
            director: "George Lucas",
            episodeId: 4,
            id: Film.ID(URL(string: "https://swapi.info/api/films/1")!),
            openingCrawl: "<Opening crawl>",
            planets: [
                Planet.ID(URL(string: "https://swapi.info/api/planets/1")!),
                Planet.ID(URL(string: "https://swapi.info/api/planets/2")!),
                Planet.ID(URL(string: "https://swapi.info/api/planets/3")!)
            ],
            producer: "Gary Kurtz, Rick McCallum",
            releaseDate: try dateParser.parse("1977-05-25"),
            species: [
                Species.ID(URL(string: "https://swapi.info/api/species/1")!),
                Species.ID(URL(string: "https://swapi.info/api/species/2")!),
                Species.ID(URL(string: "https://swapi.info/api/species/3")!),
                Species.ID(URL(string: "https://swapi.info/api/species/4")!),
                Species.ID(URL(string: "https://swapi.info/api/species/5")!)
            ],
            starships: [
                Starship.ID(URL(string: "https://swapi.info/api/starships/2")!),
                Starship.ID(URL(string: "https://swapi.info/api/starships/3")!),
                Starship.ID(URL(string: "https://swapi.info/api/starships/5")!),
                Starship.ID(URL(string: "https://swapi.info/api/starships/9")!),
                Starship.ID(URL(string: "https://swapi.info/api/starships/10")!),
                Starship.ID(URL(string: "https://swapi.info/api/starships/11")!),
                Starship.ID(URL(string: "https://swapi.info/api/starships/12")!),
                Starship.ID(URL(string: "https://swapi.info/api/starships/13")!)
            ],
            title: "A New Hope",
            vehicles: [
                Vehicle.ID(URL(string: "https://swapi.info/api/vehicles/4")!),
                Vehicle.ID(URL(string: "https://swapi.info/api/vehicles/6")!),
                Vehicle.ID(URL(string: "https://swapi.info/api/vehicles/7")!),
                Vehicle.ID(URL(string: "https://swapi.info/api/vehicles/8")!)
            ]
        )

        #expect(film == expectedFilm)
    }
}
