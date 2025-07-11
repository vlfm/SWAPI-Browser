import Foundation

public protocol URLSessionProtocol: Sendable {
    func data(for: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}
