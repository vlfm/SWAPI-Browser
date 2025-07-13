import Domain
import Foundation

extension Planet: ApiEntity {
    init(dto: PlanetDto) {
        self.init(
            climate: dto.climate,
            diameter: dto.diameter,
            films: dto.films.map { Film.ID($0) },
            gravity: dto.gravity,
            id: ID(dto.url),
            name: dto.name,
            orbitalPeriod: dto.orbital_period,
            population: dto.population,
            residents: dto.residents.map { Person.ID($0) },
            rotationPeriod: dto.rotation_period,
            surfaceWater: dto.surface_water,
            terrain: dto.terrain
        )
    }
}

struct PlanetDto: Codable {
    let climate: String
    let diameter: String
    let films: [URL]
    let gravity: String
    let name: String
    let orbital_period: String
    let population: String
    let residents: [URL]
    let rotation_period: String
    let surface_water: String
    let terrain: String
    let url: URL
}
