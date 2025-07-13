import Domain
import Foundation

extension Person: ApiEntity {
    init(dto: PersonDto) {
        self.init(
            birthYear: dto.birth_year,
            eyeColor: dto.eye_color,
            films: dto.films.map { Film.ID($0) },
            gender: dto.gender,
            hairColor: dto.hair_color,
            height: dto.height,
            homeworld: Planet.ID(dto.homeworld),
            id: ID(dto.url),
            mass: dto.mass,
            name: dto.name,
            skinColor: dto.skin_color,
            species: dto.species.map { Species.ID($0) },
            starships: dto.starships.map { Starship.ID($0) },
            vehicles: dto.vehicles.map { Vehicle.ID($0) }
        )
    }
}

struct PersonDto: Codable {
    let birth_year: String
    let eye_color: String
    let films: [URL]
    let gender: String
    let hair_color: String
    let height: String
    let homeworld: URL
    let mass: String
    let name: String
    let skin_color: String
    let species: [URL]
    let starships: [URL]
    let url: URL
    let vehicles: [URL]
}
