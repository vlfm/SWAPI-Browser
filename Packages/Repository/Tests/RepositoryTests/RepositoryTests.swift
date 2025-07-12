import Domain
import Testing

@testable import Repository

struct RepositoryTests {
    let sut = makeRepository()

    @Test
    func saveRoot() async throws {
        #expect(try await sut.fetchRoot() == nil)
        try await sut.saveRoot(root)
        #expect(try await sut.fetchRoot() == root)
    }

    @Test
    func fetchAll() async throws {
        #expect(try await sut.fetchAll(entityType: Planet.self) == [])
        try await sut.save(entities: planets)
        #expect(try await sut.fetchAll(entityType: Planet.self) == planets)
    }

    @Test
    func fetchAll_sortOrder() async throws {
        #expect(try await sut.fetchAll(entityType: Planet.self) == [])

        // save out of order
        try await sut.save(entities: [planets[1]])
        try await sut.save(entities: [planets[0]])
        try await sut.save(entities: [planets[2]])

        #expect(try await sut.fetchAll(entityType: Planet.self) == planets)
    }

    @Test
    func fetch() async throws {
        #expect(try await sut.fetch(entityType: Planet.self, id: planets[0].id) == nil)
        #expect(try await sut.fetch(entityType: Planet.self, id: planets[1].id) == nil)
        #expect(try await sut.fetch(entityType: Planet.self, id: planets[2].id) == nil)

        try await sut.save(entities: planets)

        #expect(try await sut.fetch(entityType: Planet.self, id: planets[0].id) == planets[0])
        #expect(try await sut.fetch(entityType: Planet.self, id: planets[1].id) == planets[1])
        #expect(try await sut.fetch(entityType: Planet.self, id: planets[2].id) == planets[2])
    }

    @Test
    func save() async throws {
        try await sut.save(entities: [planets[0]])
        #expect(try await sut.fetchAll(entityType: Planet.self) == [planets[0]])

        try await sut.save(entities: [planets[1]])
        #expect(try await sut.fetchAll(entityType: Planet.self) == [planets[0], planets[1]])

        try await sut.save(entities: [planets[2]])
        #expect(try await sut.fetchAll(entityType: Planet.self) == planets)

        // save duplicates
        try await sut.save(entities: planets)
        try await sut.save(entities: planets)

        #expect(try await sut.fetchAll(entityType: Planet.self) == planets)
    }
}
