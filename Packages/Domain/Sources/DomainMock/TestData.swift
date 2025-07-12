import Domain
import Foundation

public let root = Root(
    films: URL(string: "https://swapi.info/api/films")!,
    people: URL(string: "https://swapi.info/api/people")!,
    planets: URL(string: "https://swapi.info/api/planets")!,
    species: URL(string: "https://swapi.info/api/species")!,
    starships: URL(string: "https://swapi.info/api/starships")!,
    vehicles: URL(string: "https://swapi.info/api/vehicles")!,
)

public let planets: [Planet] = [
    Planet(
        climate: "arid",
        diameter: 10465,
        films: [
            Film.ID(URL(string: "https://swapi.info/api/films/1")!)
        ],
        gravity: "1 standard",
        id: Planet.ID(URL(string: "https://swapi.info/api/planets/1")!),
        name: "Tatooine",
        orbitalPeriod: 304,
        population: 200000,
        residents: [
            Person.ID(URL(string: "https://swapi.info/api/people/1")!)
        ],
        rotationPeriod: 23,
        surfaceWater: 1,
        terrain: "desert"
    ),
    Planet(
        climate: "temperate",
        diameter: 12500,
        films: [
            Film.ID(URL(string: "https://swapi.info/api/films/1")!)
        ],
        gravity: "1 standard",
        id: Planet.ID(URL(string: "https://swapi.info/api/planets/2")!),
        name: "Alderaan",
        orbitalPeriod: 364,
        population: 2000000000,
        residents: [
            Person.ID(URL(string: "https://swapi.info/api/people/5")!)
        ],
        rotationPeriod: 24,
        surfaceWater: 40,
        terrain: "grasslands, mountains"
    ),
    Planet(
        climate: "temperate, tropical",
        diameter: 10200,
        films: [
            Film.ID(URL(string: "https://swapi.info/api/films/1")!)
        ],
        gravity: "1 standard",
        id: Planet.ID(URL(string: "https://swapi.info/api/planets/3")!),
        name: "Yavin IV",
        orbitalPeriod: 4818,
        population: 1000,
        residents: [],
        rotationPeriod: 24,
        surfaceWater: 8,
        terrain: "jungle, rainforests"
    )
]
