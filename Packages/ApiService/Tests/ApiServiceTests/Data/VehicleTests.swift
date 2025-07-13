import Domain
import Foundation
import Testing

@testable import ApiService

struct VehicleTests {
    @Test
    func initWithDto() throws {
        let data = try #require(try Bundle.module.jsonData(forResource: "Vehicle"))
        let dto = try JSONDecoder().decode(VehicleDto.self, from: data)
        let vehicle = Vehicle(dto: dto)
        let expectedVehicle = Vehicle(
            cargoCapacity: "50000",
            consumables: "2 months",
            costInCredits: "150000",
            crew: "46",
            films: [
                Film.ID(URL(string: "https://swapi.info/api/films/1")!),
                Film.ID(URL(string: "https://swapi.info/api/films/5")!)
            ],
            id: Vehicle.ID(URL(string: "https://swapi.info/api/vehicles/4")!),
            length: "36.8",
            manufacturer: "Corellia Mining Corporation",
            maxAtmospheringSpeed: "30",
            model: "Digger Crawler",
            name: "Sand Crawler",
            passengers: "30",
            pilots: [],
            vehicleClass: "wheeled"
        )

        #expect(vehicle == expectedVehicle)
    }
}
