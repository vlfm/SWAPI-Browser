import Domain
import Interactor
import TestUtils

public final class InteractorMock: Interactor {
    public let filmsMockFunc = AsyncMockFunc<Void, [Film], Error>()
    public let peopleMockFunc = AsyncMockFunc<Void, [Person], Error>()
    public let planetsMockFunc = AsyncMockFunc<Void, [Planet], Error>()
    public let speciesMockFunc = AsyncMockFunc<Void, [Species], Error>()
    public let starshipsMockFunc = AsyncMockFunc<Void, [Starship], Error>()
    public let vehiclesMockFunc = AsyncMockFunc<Void, [Vehicle], Error>()

    public let filmMockFunc = AsyncMockFunc<Film.ID, Film, Error>()
    public let personMockFunc = AsyncMockFunc<Person.ID, Person, Error>()
    public let planetMockFunc = AsyncMockFunc<Planet.ID, Planet, Error>()
    public let speciesOneMockFunc = AsyncMockFunc<Species.ID, Species, Error>()
    public let starshipMockFunc = AsyncMockFunc<Starship.ID, Starship, Error>()
    public let vehicleMockFunc = AsyncMockFunc<Vehicle.ID, Vehicle, Error>()

    public func films() async throws -> [Film] {
        return try await filmsMockFunc.call()
    }

    public func people() async throws -> [Person] {
        return try await peopleMockFunc.call()
    }

    public func planets() async throws -> [Planet] {
        return try await planetsMockFunc.call()
    }

    public func species() async throws -> [Species] {
        return try await speciesMockFunc.call()
    }

    public func starships() async throws -> [Starship] {
        return try await starshipsMockFunc.call()
    }

    public func vehicles() async throws -> [Vehicle] {
        return try await vehiclesMockFunc.call()
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
