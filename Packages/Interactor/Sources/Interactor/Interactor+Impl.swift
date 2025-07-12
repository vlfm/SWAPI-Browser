import ApiService
import Domain
import Repository

public func makeInteractor(apiService: ApiService, repository: Repository) -> Interactor {
    return InteractorImpl(apiService: apiService, repository: repository)
}

private final class InteractorImpl: Interactor {
    let apiService: ApiService
    let repository: Repository

    init(apiService: ApiService, repository: Repository) {
        self.apiService = apiService
        self.repository = repository
    }

    func films() async throws -> [Film] {
        return try await getList()
    }

    func people() async throws -> [Person] {
        return try await getList()
    }

    func planets() async throws -> [Planet] {
        return try await getList()
    }

    func species() async throws -> [Species] {
        return try await getList()
    }

    func starships() async throws -> [Starship] {
        return try await getList()
    }

    func vehicles() async throws -> [Vehicle] {
        return try await getList()
    }

    func film(id: Film.ID) async throws -> Film {
        return try await getOne(id: id)
    }

    func person(id: Person.ID) async throws -> Person {
        return try await getOne(id: id)
    }

    func planet(id: Planet.ID) async throws -> Planet {
        return try await getOne(id: id)
    }

    func species(id: Species.ID) async throws -> Species {
        return try await getOne(id: id)
    }

    func starship(id: Starship.ID) async throws -> Starship {
        return try await getOne(id: id)
    }

    func vehicle(id: Vehicle.ID) async throws -> Vehicle {
        return try await getOne(id: id)
    }
}

extension InteractorImpl {
    func root() async throws -> Root {
        if let root = try await repository.fetchRoot() {
            return root
        } else {
            let root = try await apiService.root()
            try await repository.saveRoot(root)
            return root
        }
    }
}

extension InteractorImpl {
    // Simple strategy of loading list of entities:
    // First, try load from repository, next try to load from api service
    func getList<Entity: InteractorEntity>() async throws -> [Entity] {
        let entities = try await Entity.get(from: repository)

        // Here, if repository returns empty collection, try load from api.
        // Although, empty result may be valid (api returned empty result before),
        // ignore this case for simplicity.
        if !entities.isEmpty {
            return entities
        } else {
            let root = try await self.root()
            let entities = try await Entity.get(from: apiService, root: root)
            try await repository.save(entities: entities)
            return entities
        }
    }

    func getOne<Entity: InteractorEntity>(id: Entity.ID) async throws -> Entity {
        if let entity = try await Entity.get(from: repository, id: id) {
            return entity
        } else {
            let entity = try await Entity.get(from: apiService, id: id)
            try await repository.save(entities: [entity])
            return entity
        }
    }
}
