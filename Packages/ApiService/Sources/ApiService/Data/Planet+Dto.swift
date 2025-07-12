import Domain
import Foundation

extension Planet: ApiEntity {
    init(dto: PlanetDto) throws {
        self.init(
            climate: dto.climate,
            diameter: try dto.diameter.parseDouble(message: "Planet.diameter: \(dto.diameter)"),
            films: dto.films.map { Film.ID($0) },
            gravity: dto.gravity,
            id: ID(dto.url),
            name: dto.name,
            orbitalPeriod: try dto.orbital_period.parseDouble(
                message: "Planet.orbital_period: \(dto.orbital_period)"
            ),
            population: try dto.population.parseInt64(
                message: "Planet.population: \(dto.population)"
            ),
            residents: dto.residents.map { Person.ID($0) },
            rotationPeriod: try dto.rotation_period.parseDouble(
                message: "Planet.rotation_period: \(dto.rotation_period)"
            ),
            surfaceWater: try dto.surface_water.parseDouble(
                message: "Planet.surface_water: \(dto.surface_water)"
            ),
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
