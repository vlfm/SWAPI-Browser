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

    func films(source: Source) async throws -> [Film] {
        return try await getList(source: source)
    }

    func people(source: Source) async throws -> [Person] {
        return try await getList(source: source)
    }

    func planets(source: Source) async throws -> [Planet] {
        return try await getList(source: source)
    }

    func species(source: Source) async throws -> [Species] {
        return try await getList(source: source)
    }

    func starships(source: Source) async throws -> [Starship] {
        return try await getList(source: source)
    }

    func vehicles(source: Source) async throws -> [Vehicle] {
        return try await getList(source: source)
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
    func getList<Entity: InteractorEntity>(source: Source) async throws -> [Entity] {
        switch source {
        case .api:
            let root = try await self.root()
            let entities = try await Entity.get(from: apiService, root: root)
            try await repository.save(entities: entities)
            return entities
        case .cache:
            return try await Entity.get(from: repository)
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
