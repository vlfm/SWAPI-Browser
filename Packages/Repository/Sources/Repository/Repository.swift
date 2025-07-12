import Domain

public protocol Repository: Actor {
    func fetchRoot() async throws -> Root?
    func saveRoot(_ root: Root) async throws

    func fetchAll<Entity: RepositoryEntity>(entityType: Entity.Type) async throws -> [Entity]
    func fetch<Entity: RepositoryEntity>(entityType: Entity.Type, id: Entity.ID) async throws -> Entity?
    func save<Entity: RepositoryEntity>(entities: [Entity]) async throws
    // don't need delete methods
}
