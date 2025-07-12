import Domain

public func makeRepository() -> Repository {
    return RepositoryImpl()
}

private actor RepositoryImpl: Repository {
    var root: Root?
    var store: [ObjectIdentifier: [AnyHashable: Any]] = [:]

    func fetchRoot() async throws -> Root? {
        return root
    }

    func saveRoot(_ root: Root) async throws {
        self.root = root
    }

    func fetchAll<Entity: RepositoryEntity>(entityType: Entity.Type) async throws -> [Entity] {
        // Need to define a sort order for the entities.
        // There is no explicit sort order in the SWAPI api, but it seems it sorts its entities by id.

        // People, for example:
        // - https://swapi.info/api/people/1
        // - https://swapi.info/api/people/2
        // - https://swapi.info/api/people/3
        // ...

        // To maintain this order, this methods sorts entities by ids as well.

        let dictionary = self[Entity.self]

        guard let values = Array(dictionary.values) as? [Entity] else {
            return []
        }

        return values.sorted { $0.id.value.absoluteString < $1.id.value.absoluteString }
    }

    func fetch<Entity: RepositoryEntity>(entityType: Entity.Type, id: Entity.ID) async throws -> Entity? {
        let key = AnyHashable(id)
        let dictionary = self[Entity.self]

        if let value = dictionary[key] as? Entity {
            return value
        } else {
            return nil
        }
    }

    func save<Entity: RepositoryEntity>(entities: [Entity]) async throws {
        var dictionary = self[Entity.self]

        for entity in entities {
            let key = AnyHashable(entity.id)
            dictionary[key] = entity
        }

        self[Entity.self] = dictionary
    }
}

extension RepositoryImpl {
    subscript<Entity: RepositoryEntity>(entityType: Entity.Type) -> [AnyHashable: Any] {
        get {
            let typeKey = ObjectIdentifier(Entity.self)
            return store[typeKey] ?? [:]
        }
        set {
            let typeKey = ObjectIdentifier(Entity.self)
            store[typeKey] = newValue
        }
    }
}
