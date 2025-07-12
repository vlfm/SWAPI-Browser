import ApiService
import Domain
import Repository

public protocol Interactor: AnyObject, Sendable {
    func films() async throws -> [Film]
    func people() async throws -> [Person]
    func planets() async throws -> [Planet]
    func species() async throws -> [Species]
    func starships() async throws -> [Starship]
    func vehicles() async throws -> [Vehicle]

    func film(id: Film.ID) async throws -> Film
    func person(id: Person.ID) async throws -> Person
    func planet(id: Planet.ID) async throws -> Planet
    func species(id: Species.ID) async throws -> Species
    func starship(id: Starship.ID) async throws -> Starship
    func vehicle(id: Vehicle.ID) async throws -> Vehicle
}
