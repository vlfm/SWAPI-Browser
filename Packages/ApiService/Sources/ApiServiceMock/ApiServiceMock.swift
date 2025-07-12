import ApiService
import Domain
import TestUtils

public final class ApiServiceMock: ApiService {
    public let rootMockFunc = AsyncMockFunc<Void, Root, Error>()

    public let filmsMockFunc = AsyncMockFunc<Root, [Film], Error>()
    public let peopleMockFunc = AsyncMockFunc<Root, [Person], Error>()
    public let planetsMockFunc = AsyncMockFunc<Root, [Planet], Error>()
    public let speciesMockFunc = AsyncMockFunc<Root, [Species], Error>()
    public let starshipsMockFunc = AsyncMockFunc<Root, [Starship], Error>()
    public let vehiclesMockFunc = AsyncMockFunc<Root, [Vehicle], Error>()

    public let filmMockFunc = AsyncMockFunc<Film.ID, Film, Error>()
    public let personMockFunc = AsyncMockFunc<Person.ID, Person, Error>()
    public let planetMockFunc = AsyncMockFunc<Planet.ID, Planet, Error>()
    public let speciesOneMockFunc = AsyncMockFunc<Species.ID, Species, Error>()
    public let starshipMockFunc = AsyncMockFunc<Starship.ID, Starship, Error>()
    public let vehicleMockFunc = AsyncMockFunc<Vehicle.ID, Vehicle, Error>()

    public init() {
    }

    public func root() async throws -> Root {
        return try await rootMockFunc.call()
    }

    public func films(root: Root) async throws -> [Film] {
        return try await filmsMockFunc.call(root)
    }

    public func people(root: Root) async throws -> [Person] {
        return try await peopleMockFunc.call(root)
    }

    public func planets(root: Root) async throws -> [Planet] {
        return try await planetsMockFunc.call(root)
    }

    public func species(root: Root) async throws -> [Species] {
        return try await speciesMockFunc.call(root)
    }

    public func starships(root: Root) async throws -> [Starship] {
        return try await starshipsMockFunc.call(root)
    }

    public func vehicles(root: Root) async throws -> [Vehicle] {
        return try await vehiclesMockFunc.call(root)
    }

    public func film(id: Film.ID) async throws -> Film {
        return try await filmMockFunc.call(id)
    }

    public func person(id: Person.ID) async throws -> Person {
        return try await personMockFunc.call(id)
    }

    public func planet(id: Planet.ID) async throws -> Planet {
        return try await planetMockFunc.call(id)
    }

    public func species(id: Species.ID) async throws -> Species {
        return try await speciesOneMockFunc.call(id)
    }

    public func starship(id: Starship.ID) async throws -> Starship {
        return try await starshipMockFunc.call(id)
    }

    public func vehicle(id: Vehicle.ID) async throws -> Vehicle {
        return try await vehicleMockFunc.call(id)
    }
}
