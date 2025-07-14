import ApiService
import Domain
import Repository

public protocol Interactor: AnyObject, Sendable {
    func films(source: Source) async throws -> [Film]
    func people(source: Source) async throws -> [Person]
    func planets(source: Source) async throws -> [Planet]
    func species(source: Source) async throws -> [Species]
    func starships(source: Source) async throws -> [Starship]
    func vehicles(source: Source) async throws -> [Vehicle]

    func film(id: Film.ID) async throws -> Film
    func person(id: Person.ID) async throws -> Person
    func planet(id: Planet.ID) async throws -> Planet
    func species(id: Species.ID) async throws -> Species
    func starship(id: Starship.ID) async throws -> Starship
    func vehicle(id: Vehicle.ID) async throws -> Vehicle
}
