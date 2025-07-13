import Domain
import Foundation

extension Starship: ApiEntity {
    init(dto: StarshipDto) {
        self.init(
            cargoCapacity: dto.cargo_capacity,
            consumables: dto.consumables,
            costInCredits: dto.cost_in_credits,
            crew: dto.crew,
            films: dto.films.map { Film.ID($0) },
            hyperdriveRating: dto.hyperdrive_rating,
            id: ID(dto.url),
            length: dto.length,
            manufacturer: dto.manufacturer,
            maxAtmospheringSpeed: dto.max_atmosphering_speed,
            maxNumberOfMegalights: dto.MGLT,
            model: dto.model,
            name: dto.name,
            passengers: dto.passengers,
            pilots: dto.pilots.map { Person.ID($0) },
            starshipClass: dto.starship_class
        )
    }
}

struct StarshipDto: Codable {
    let cargo_capacity: String
    let consumables: String
    let cost_in_credits: String
    let crew: String
    let films: [URL]
    let hyperdrive_rating: String
    let length: String
    let manufacturer: String
    let max_atmosphering_speed: String
    let MGLT: String
    let model: String
    let name: String
    let passengers: String
    let pilots: [URL]
    let starship_class: String
    let url: URL
}
