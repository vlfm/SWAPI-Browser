import Domain
import Foundation

extension Vehicle: ApiEntity {
    init(dto: VehicleDto) throws {
        self.init(
            cargoCapacity: try dto.cargo_capacity.parseDouble(
                message: "Vehicle.cargo_capacity: \(dto.cargo_capacity)"
            ),
            consumables: dto.consumables,
            costInCredits: try dto.cost_in_credits.parseDouble(
                message: "Vehicle.cost_in_credits: \(dto.cost_in_credits)"
            ),
            crew: try dto.crew.parseInt(message: "Vehicle.crew: \(dto.crew)"),
            films: dto.films.map { Film.ID($0) },
            id: ID(dto.url),
            length: try dto.length.parseDouble(message: "Vehicle.length: \(dto.length)"),
            manufacturer: dto.manufacturer,
            maxAtmospheringSpeed: dto.max_atmosphering_speed,
            model: dto.model,
            name: dto.name,
            passengers: try dto.passengers.parseInt(message: "Vehicle.passengers: \(dto.passengers)"),
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
