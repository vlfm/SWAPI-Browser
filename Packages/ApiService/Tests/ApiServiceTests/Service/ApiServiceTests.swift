import Domain
import Foundation
import HttpClient
import HttpClientMock
import Testing
import TestUtils

@testable import ApiService

struct ApiServiceTests {
    let httpClient: HttpClientMock
    let sut: ApiService

    let root = Root(
        films: URL(string: "https://swapi.info/api/films")!,
        people: URL(string: "https://swapi.info/api/people")!,
        planets: URL(string: "https://swapi.info/api/planets")!,
        species: URL(string: "https://swapi.info/api/species")!,
        starships: URL(string: "https://swapi.info/api/starships")!,
        vehicles: URL(string: "https://swapi.info/api/vehicles")!
    )

    let filmUrl = URL(string: "https://swapi.info/api/films/1")!

    init() {
        self.httpClient = HttpClientMock()
        self.sut = makeApiService(httpClient: httpClient)
    }

    // MARK: root

    @Test
    func root_callsHttpClient() async throws {
        let data = try #require(try Bundle.module.jsonData(forResource: "Root"))
        await httpClient.executeMockFunc.willReturn(data)
        _ = try await sut.root()
        #expect(await httpClient.executeMockFunc.callCount == 1)
        #expect(await httpClient.executeMockFunc.lastInput
                == HttpRequest(method: .get, url: URL(string: "https://swapi.info/api")!)
        )
    }

    @Test
    func root_httpClientSuccess_returnsRoot() async throws {
        let data = try #require(try Bundle.module.jsonData(forResource: "Root"))
        await httpClient.executeMockFunc.willReturn(data)
        #expect(try await sut.root() == root)
    }

    @Test
    func root_httpClientFailure_throwsError() async throws {
        let error = HttpError.errorStatusCode(statusCode: 500)
        await httpClient.executeMockFunc.willThrow(error)
        await #expect(throws: error) {
            _ = try await sut.root()
        }
    }

    // MARK: films

    @Test
    func films_callsHttpClient() async throws {
        let data = try #require(try Bundle.module.jsonData(forResource: "Films"))
        await httpClient.executeMockFunc.willReturn(data)
        _ = try await sut.films(root: root)
        #expect(await httpClient.executeMockFunc.callCount == 1)
        #expect(await httpClient.executeMockFunc.lastInput
                == HttpRequest(method: .get, url: root.films)
        )
    }

    @Test
    func films_httpClientSuccess_returnsFilms() async throws {
        let data = try #require(try Bundle.module.jsonData(forResource: "Films"))
        await httpClient.executeMockFunc.willReturn(data)
        let films = try await sut.films(root: root)
        #expect(films.count == 6)
        #expect(films[0].title == "A New Hope")
        #expect(films[5].title == "Revenge of the Sith")
        // Assert all properties ...
    }

    @Test
    func films_httpClientFailure_throwsError() async throws {
        let error = HttpError.errorStatusCode(statusCode: 500)
        await httpClient.executeMockFunc.willThrow(error)
        await #expect(throws: error) {
            _ = try await sut.films(root: root)
        }
    }

    // MARK: people

    // Tests for other endpoints
    // Skipped to save time

    // MARK: planets

    // MARK: species (list)

    // MARK: starships

    // MARK: vehicles

    // MARK: film

    @Test
    func film_callsHttpClient() async throws {
        let data = try #require(try Bundle.module.jsonData(forResource: "Film"))
        await httpClient.executeMockFunc.willReturn(data)
        _ = try await sut.film(id: Film.ID(filmUrl))
        #expect(await httpClient.executeMockFunc.callCount == 1)
        #expect(await httpClient.executeMockFunc.lastInput
                == HttpRequest(method: .get, url: filmUrl)
        )
    }

    @Test
    func film_httpClientSuccess_returnsFilms() async throws {
        let data = try #require(try Bundle.module.jsonData(forResource: "Film"))
        await httpClient.executeMockFunc.willReturn(data)
        let film = try await sut.film(id: Film.ID(filmUrl))
        #expect(film.title == "A New Hope")
        // Assert all properties ...
    }

    @Test
    func film_httpClientFailure_throwsError() async throws {
        let error = HttpError.errorStatusCode(statusCode: 500)
        await httpClient.executeMockFunc.willThrow(error)
        await #expect(throws: error) {
            _ = try await sut.film(id: Film.ID(filmUrl))
        }
    }

    // MARK: person

    // MARK: planet

    // MARK: species (one)

    // MARK: starship

    // MARK: vehicle
}
