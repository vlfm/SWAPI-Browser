import Foundation
import HttpClient
import TestUtils

public final class HttpClientMock: HttpClient {
    public let executeMockFunc = AsyncMockFunc<HttpRequest, Data, Error>()

    public init() {
    }

    public func execute(httpRequest: HttpRequest) async throws -> Data {
        return try await executeMockFunc.call(httpRequest)
    }
}
