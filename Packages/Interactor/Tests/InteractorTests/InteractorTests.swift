import ApiServiceMock
import Domain
import DomainMock
import Repository
import Testing

@testable import Interactor

struct InteractorTests {
    let apiService: ApiServiceMock
    let repository: Repository
    let sut: Interactor

    init() {
        self.apiService = ApiServiceMock()
        self.repository = makeRepository()
        self.sut = makeInteractor(apiService: apiService, repository: repository)
    }

    // MARK: films

    // Tests for other methods
    // Skipped to save time

    // MARK: people

    // MARK: planets

    @Test
    func planets_sourceIsApi_returnsPlanetsFomApi() async throws {
        await apiService.rootMockFunc.willReturn(root)
        await apiService.planetsMockFunc.willReturn(planets)
        #expect(try await sut.planets(source: .api) == planets)
    }

    @Test
    func planets_sourceIsApi_savesPlanetsToRepository() async throws {
        await apiService.rootMockFunc.willReturn(root)
        await apiService.planetsMockFunc.willReturn(planets)
        _ = try await sut.planets(source: .api)
        #expect(try await sut.planets(source: .cache) == planets)
    }

    @Test
    func planets_sourceIsCache_returnsPlanetsFromRepository() async throws {
        try await repository.save(entities: planets)
        #expect(try await sut.planets(source: .cache) == planets)
        #expect(await apiService.planetsMockFunc.callCount == 0)
    }

    // MARK: species (list)

    // MARK: starships

    // MARK: vehicles

    // MARK: film

    // MARK: person

    // MARK: planet

    @Test
    func planet_repositoryIsNotEmpty_returnsPlanetFromRepository() async throws {
        try await repository.save(entities: [planets[0]])
        #expect(try await sut.planet(id: planets[0].id) == planets[0])
    }

    @Test
    func planet_repositoryIsNotEmpty_doesntCallApiService() async throws {
        try await repository.save(entities: [planets[0]])
        _ = try await sut.planet(id: planets[0].id)
        #expect(await apiService.planetMockFunc.callCount == 0)
    }

    @Test
    func planet_repositoryIsEmpty_callApiService() async throws {
        await apiService.planetMockFunc.willReturn(planets[0])
        _ = try await sut.planet(id: planets[0].id)
        #expect(await apiService.planetMockFunc.callCount == 1)
        #expect(await apiService.planetMockFunc.lastInput == planets[0].id)
    }

    @Test
    func planet_repositoryIsEmpty_savesPlanetToRepository() async throws {
        await apiService.planetMockFunc.willReturn(planets[0])
        _ = try await sut.planet(id: planets[0].id)
        #expect(try await repository.fetch(entityType: Planet.self, id: planets[0].id) == planets[0])
    }

    @Test
    func planet_repositoryIsEmpty_returnsPlanetFromApiService() async throws {
        await apiService.planetMockFunc.willReturn(planets[0])
        #expect(try await sut.planet(id: planets[0].id) == planets[0])
    }

    // MARK: species

    // MARK: starship

    // MARK: vehicle
}
