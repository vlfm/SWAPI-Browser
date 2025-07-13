import Domain
import Foundation

extension Species: ApiEntity {
    init(dto: SpeciesDto) {
        self.init(
            averageHeight: dto.average_height,
            averageLifespan: dto.average_lifespan,
            classification: dto.classification,
            designation: dto.designation,
            eyeColors: dto.eye_colors,
            films: dto.films.map { Film.ID($0) },
            hairColors: dto.hair_colors,
            homeworld: Planet.ID(dto.homeworld),
            id: ID(dto.url),
            language: dto.language,
            name: dto.name,
            people: dto.people.map { Person.ID($0) },
            skinColors: dto.skin_colors,
        )
    }
}

struct SpeciesDto: Codable {
    let average_height: String
    let average_lifespan: String
    let classification: String
    let designation: String
    let eye_colors: String
    let films: [URL]
    let hair_colors: String
    let homeworld: URL
    let language: String
    let name: String
    let people: [URL]
    let skin_colors: String
    let url: URL
}
