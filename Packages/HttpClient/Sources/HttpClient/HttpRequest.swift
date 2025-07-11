import Foundation

public struct HttpRequest: Equatable, Sendable {
    public enum Method: String, Sendable {
        case get = "GET"
    }

    public var method: Method
    public var url: URL

    public init(method: Method = .get, url: URL) {
        self.method = method
        self.url = url
    }
}

public extension HttpRequest {
    init(baseUrl: URL, method: Method = .get, path: String) throws {
        self.method = method
        self.url = baseUrl.appendingPathComponent(path)
    }
}
