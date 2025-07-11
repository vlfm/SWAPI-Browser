import Foundation

public func makeHttpClient(urlSession: URLSessionProtocol) -> HttpClient {
    return HttpClientImpl(urlSession: urlSession)
}

private final class HttpClientImpl: HttpClient {
    let urlSession: URLSessionProtocol

    init(urlSession: URLSessionProtocol) {
        self.urlSession = urlSession
    }

    @discardableResult
    func execute(httpRequest: HttpRequest) async throws -> Data {
        let urlRequest = URLRequest(httpRequest: httpRequest)
        let (data, response) = try await urlSession.data(for: urlRequest)

        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw HttpError.missingStatusCode
        }

        guard (200 ... 299).contains(statusCode) else {
            throw HttpError.errorStatusCode(statusCode: statusCode)
        }

        return data
    }
}

private extension HttpClient {
    func execute<Response: Decodable>(
        httpRequest: HttpRequest,
        responseType: Response.Type
    ) async throws -> Response {
        let data = try await execute(httpRequest: httpRequest)
        return try JSONDecoder().decode(responseType, from: data)
    }
}
