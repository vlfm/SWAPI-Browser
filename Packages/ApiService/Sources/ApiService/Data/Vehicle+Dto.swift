import Domain
import Foundation

extension Vehicle: ApiEntity {
    init(dto: VehicleDto) {
        self.init(
            cargoCapacity: dto.cargo_capacity,
            consumables: dto.consumables,
            costInCredits: dto.cost_in_credits,
            crew: dto.crew,
            films: dto.films.map { Film.ID($0) },
            id: ID(dto.url),
            length: dto.length,
            manufacturer: dto.manufacturer,
            maxAtmospheringSpeed: dto.max_atmosphering_speed,
            model: dto.model,
            name: dto.name,
            passengers: dto.passengers,
            pilots: dto.pilots.map { Person.ID($0) },
            vehicleClass: dto.vehicle_class
        )
    }
}

struct VehicleDto: Codable {
    let cargo_capacity: String
    let consumables: String
    let cost_in_credits: String
    let crew: String
    let films: [URL]
    let length: String
    let manufacturer: String
    let max_atmosphering_speed: String
    let model: String
    let name: String
    let passengers: String
    let pilots: [URL]
    let url: URL
    let vehicle_class: String
}
