import ApiService
import Domain
import Repository

protocol InteractorEntity: Identifiable, RepositoryEntity, Sendable {
    static func get(from apiService: ApiService, root: Root) async throws -> [Self]
    static func get(from apiService: ApiService, id: ID) async throws -> Self

    static func get(from repository: Repository) async throws -> [Self]
    static func get(from repository: Repository, id: ID) async throws -> Self?
}

extension InteractorEntity {
    static func get(from repository: Repository) async throws -> [Self] {
        return try await repository.fetchAll(entityType: Self.self)
    }

    static func get(from repository: Repository, id: ID) async throws -> Self? {
        return try await repository.fetch(entityType: Self.self, id: id)
    }
}

extension Film: InteractorEntity {
    static func get(from apiService: ApiService, root: Root) async throws -> [Self] {
        return try await apiService.films(root: root)
    }

    static func get(from apiService: ApiService, id: ID) async throws -> Self {
        return try await apiService.film(id: id)
    }
}

extension Person: InteractorEntity {
    static func get(from apiService: ApiService, root: Root) async throws -> [Self] {
        return try await apiService.people(root: root)
    }

    static func get(from apiService: ApiService, id: ID) async throws -> Self {
        return try await apiService.person(id: id)
    }
}

extension Planet: InteractorEntity {
    static func get(from apiService: ApiService, root: Root) async throws -> [Self] {
        return try await apiService.planets(root: root)
    }

    static func get(from apiService: ApiService, id: ID) async throws -> Self {
        return try await apiService.planet(id: id)
    }
}

extension Species: InteractorEntity {
    static func get(from apiService: ApiService, root: Root) async throws -> [Self] {
        return try await apiService.species(root: root)
    }

    static func get(from apiService: ApiService, id: ID) async throws -> Self {
        return try await apiService.species(id: id)
    }
}

extension Starship: InteractorEntity {
    static func get(from apiService: ApiService, root: Root) async throws -> [Self] {
        return try await apiService.starships(root: root)
    }

    static func get(from apiService: ApiService, id: ID) async throws -> Self {
        return try await apiService.starship(id: id)
    }
}

extension Vehicle: InteractorEntity {
    static func get(from apiService: ApiService, root: Root) async throws -> [Self] {
        return try await apiService.vehicles(root: root)
    }

    static func get(from apiService: ApiService, id: ID) async throws -> Self {
        return try await apiService.vehicle(id: id)
    }
}
