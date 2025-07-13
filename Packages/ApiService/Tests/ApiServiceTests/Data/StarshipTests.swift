import Domain
import Foundation
import Testing

@testable import ApiService

struct StarshipTests {
    @Test
    func initWithDto() throws {
        let data = try #require(try Bundle.module.jsonData(forResource: "Starship"))
        let dto = try JSONDecoder().decode(StarshipDto.self, from: data)
        let starship = Starship(dto: dto)
        let expectedStarship = Starship(
            cargoCapacity: "1000000000000",
            consumables: "3 years",
            costInCredits: "1000000000000",
            crew: "342,953",
            films: [
                Film.ID(URL(string: "https://swapi.info/api/films/1")!)
            ],
            hyperdriveRating: "4.0",
            id: Starship.ID(URL(string: "https://swapi.info/api/starships/9")!),
            length: "120000",
            manufacturer: "Imperial Department of Military Research, Sienar Fleet Systems",
            maxAtmospheringSpeed: "n/a",
            maxNumberOfMegalights: "10",
            model: "DS-1 Orbital Battle Station",
            name: "Death Star",
            passengers: "843,342",
            pilots: [],
            starshipClass: "Deep Space Mobile Battlestation"
        )

        #expect(starship == expectedStarship)
    }
}
