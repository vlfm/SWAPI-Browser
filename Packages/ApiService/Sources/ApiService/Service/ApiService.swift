import Domain

public protocol ApiService: AnyObject, Sendable {
    func root() async throws -> Root

    func films(root: Root) async throws -> [Film]
    func people(root: Root) async throws -> [Person]
    func planets(root: Root) async throws -> [Planet]
    func species(root: Root) async throws -> [Species]
    func starships(root: Root) async throws -> [Starship]
    func vehicles(root: Root) async throws -> [Vehicle]

    func film(id: Film.ID) async throws -> Film
    func person(id: Person.ID) async throws -> Person
    func planet(id: Planet.ID) async throws -> Planet
    func species(id: Species.ID) async throws -> Species
    func starship(id: Starship.ID) async throws -> Starship
    func vehicle(id: Vehicle.ID) async throws -> Vehicle
}
