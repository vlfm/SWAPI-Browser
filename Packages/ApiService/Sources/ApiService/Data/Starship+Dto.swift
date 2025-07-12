import Domain
import Foundation

extension Starship: ApiEntity {
    init(dto: StarshipDto) throws {
        self.init(
            cargoCapacity: try dto.cargo_capacity.parseDouble(
                message: "Starship.cargo_capacity: \(dto.cargo_capacity)"
            ),
            consumables: dto.consumables,
            costInCredits: try dto.cost_in_credits.parseDouble(
                message: "Starship.cost_in_credits: \(dto.cost_in_credits)"
            ),
            crew: try dto.crew.parseInt(message: "Starship.crew: \(dto.crew)"),
            films: dto.films.map { Film.ID($0) },
            hyperdriveRating: dto.hyperdrive_rating,
            id: ID(dto.url),
            length: try dto.length.parseDouble(message: "Starship.length: \(dto.length)"),
            manufacturer: dto.manufacturer,
            maxAtmospheringSpeed: dto.max_atmosphering_speed,
            maxNumberOfMegalights: try dto.MGLT.parseDouble(message: "Starship.MGLT: \(dto.MGLT)"),
            model: dto.model,
            name: dto.name,
            passengers: try dto.passengers.parseInt(message: "Starship.passengers: \(dto.passengers)"),
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
