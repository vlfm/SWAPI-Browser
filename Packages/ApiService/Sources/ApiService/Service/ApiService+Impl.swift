import Domain
import Foundation
import HttpClient

public func makeApiService(httpClient: HttpClient) -> ApiService {
    return ApiServiceImpl(httpClient: httpClient)
}

private final class ApiServiceImpl: ApiService {
    let httpClient: HttpClient

    init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }

    func root() async throws -> Root {
        let url = URL(string: "https://swapi.info/api")!
        return try await httpClient.get(url: url, type: Root.self)
    }

    func films(root: Root) async throws -> [Film] {
        return try await getList(url: root.films)
    }

    func people(root: Root) async throws -> [Person] {
        return try await getList(url: root.people)
    }

    func planets(root: Root) async throws -> [Planet] {
        return try await getList(url: root.planets)
    }

    func species(root: Root) async throws -> [Species] {
        return try await getList(url: root.species)
    }

    func starships(root: Root) async throws -> [Starship] {
        return try await getList(url: root.starships)
    }

    func vehicles(root: Root) async throws -> [Vehicle] {
        return try await getList(url: root.vehicles)
    }

    func film(id: Film.ID) async throws -> Film {
        return try await getOne(url: id.value)
    }

    func person(id: Person.ID) async throws -> Person {
        return try await getOne(url: id.value)
    }

    func planet(id: Planet.ID) async throws -> Planet {
        return try await getOne(url: id.value)
    }

    func species(id: Species.ID) async throws -> Species {
        return try await getOne(url: id.value)
    }

    func starship(id: Starship.ID) async throws -> Starship {
        return try await getOne(url: id.value)
    }

    func vehicle(id: Vehicle.ID) async throws -> Vehicle {
        return try await getOne(url: id.value)
    }
}

extension ApiServiceImpl {
    func getOne<Entity: ApiEntity>(url: URL) async throws -> Entity {
        do {
            let data = try await httpClient.data(for: url)
            return try Entity(data: data)
        } catch {
            print("ApiService error: \(error)")
            throw error
        }
    }

    func getList<Entity: ApiEntity>(url: URL) async throws -> [Entity] {
        do {
            let data = try await httpClient.data(for: url)
            let dtos = try JSONDecoder().decode([Entity.Dto].self, from: data)
            return try dtos.map { try Entity(dto: $0) }
        } catch {
            print("ApiService error: \(error)")
            throw error
        }
    }
}
