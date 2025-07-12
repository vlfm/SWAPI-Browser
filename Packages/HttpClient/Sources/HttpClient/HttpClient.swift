import Foundation

public protocol HttpClient: AnyObject, Sendable {
    @discardableResult
    func execute(httpRequest: HttpRequest) async throws -> Data
}

public extension HttpClient {
    func data(for url: URL) async throws -> Data {
        return try await execute(httpRequest: HttpRequest(url: url))
    }

    func get<T: Decodable>(url: URL, type: T.Type) async throws -> T {
        let data = try await self.data(for: url)
        return try JSONDecoder().decode(type, from: data)
    }
}
