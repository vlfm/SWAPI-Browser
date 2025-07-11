import Foundation
import HttpClient
import TestUtils

public final class URLSessionMock: URLSessionProtocol {
    public let dataMockFunc = AsyncMockFunc<URLRequest, (Data, URLResponse), Error>()

    public init() {
    }

    public func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        return try await dataMockFunc.call(request)
    }
}
