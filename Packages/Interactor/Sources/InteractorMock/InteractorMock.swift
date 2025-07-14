import Domain
import Interactor
import TestUtils

public final class InteractorMock: Interactor {
    public let filmsMockFunc = AsyncMockFunc<Source, [Film], Error>()
    public let peopleMockFunc = AsyncMockFunc<Source, [Person], Error>()
    public let planetsMockFunc = AsyncMockFunc<Source, [Planet], Error>()
    public let speciesMockFunc = AsyncMockFunc<Source, [Species], Error>()
    public let starshipsMockFunc = AsyncMockFunc<Source, [Starship], Error>()
    public let vehiclesMockFunc = AsyncMockFunc<Source, [Vehicle], Error>()

    public let filmMockFunc = AsyncMockFunc<Film.ID, Film, Error>()
    public let personMockFunc = AsyncMockFunc<Person.ID, Person, Error>()
    public let planetMockFunc = AsyncMockFunc<Planet.ID, Planet, Error>()
    public let speciesOneMockFunc = AsyncMockFunc<Species.ID, Species, Error>()
    public let starshipMockFunc = AsyncMockFunc<Starship.ID, Starship, Error>()
    public let vehicleMockFunc = AsyncMockFunc<Vehicle.ID, Vehicle, Error>()

    public init() {
    }

    public func films(source: Source) async throws -> [Film] {
        return try await filmsMockFunc.call(source)
    }

    public func people(source: Source) async throws -> [Person] {
        return try await peopleMockFunc.call(source)
    }

    public func planets(source: Source) async throws -> [Planet] {
        return try await planetsMockFunc.call(source)
    }

    public func species(source: Source) async throws -> [Species] {
        return try await speciesMockFunc.call(source)
    }

    public func starships(source: Source) async throws -> [Starship] {
        return try await starshipsMockFunc.call(source)
    }

    public func vehicles(source: Source) async throws -> [Vehicle] {
        return try await vehiclesMockFunc.call(source)
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
