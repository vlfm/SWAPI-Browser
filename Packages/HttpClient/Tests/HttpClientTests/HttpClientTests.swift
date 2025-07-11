import Foundation
import HttpClient
import HttpClientMock
import Testing

struct HttpClientTests {
    let httpClient: HttpClient
    let urlSessionMock: URLSessionMock

    let url: URL
    let successResponse: HTTPURLResponse
    let failureResponse: HTTPURLResponse

    init() {
        urlSessionMock = URLSessionMock()
        httpClient = makeHttpClient(urlSession: urlSessionMock)

        url = URL(string: "https://api.example.com")!

        successResponse = HTTPURLResponse(
            url: url, statusCode: 200, httpVersion: nil, headerFields: nil
        )!

        failureResponse = HTTPURLResponse(
            url: url, statusCode: 500, httpVersion: nil, headerFields: nil
        )!
    }

    // MARK: data

    @Test
    func data_callsUrlSession() async throws {
        await urlSessionMock.dataMockFunc.willReturn((Data(), successResponse))
        _ = try await httpClient.data(for: url)

        #expect(await urlSessionMock.dataMockFunc.callCount == 1)
        #expect(await urlSessionMock.dataMockFunc.lastInput?.url == url)

        #expect(
            await urlSessionMock.dataMockFunc.lastInput?.httpMethod ==
            HttpRequest.Method.get.rawValue
        )
    }

    // MARK: execute

    @Test
    func execute_callsUrlSession() async throws {
        let httpRequest = HttpRequest(url: url)

        await urlSessionMock.dataMockFunc.willReturn((Data(), successResponse))
        _ = try await httpClient.execute(httpRequest: httpRequest)

        #expect(await urlSessionMock.dataMockFunc.callCount == 1)
        #expect(await urlSessionMock.dataMockFunc.lastInput?.url == url)

        #expect(
            await urlSessionMock.dataMockFunc.lastInput?.httpMethod ==
            HttpRequest.Method.get.rawValue
        )
    }

    @Test
    func execute_urlSessionSuccessResponse_returnsData() async throws {
        let httpRequest = HttpRequest(method: .get, url: url)
        let data = "Hello".data(using: .utf8)!

        await urlSessionMock.dataMockFunc.willReturn((data, successResponse))
        let response = try await httpClient.execute(httpRequest: httpRequest)

        #expect(response == data)
    }

    @Test
    func execute_urlSessionResponseMissingStatusCode_throwsError() async throws {
        let httpRequest = HttpRequest(method: .get, url: url)

        await urlSessionMock.dataMockFunc.willReturn((Data(), URLResponse()))

        await #expect(throws: HttpError.missingStatusCode) {
            _ = try await httpClient.execute(httpRequest: httpRequest)
        }
    }

    @Test
    func execute_urlSessionResponseErrorStatusCode_throwsError() async throws {
        let httpRequest = HttpRequest(method: .get, url: url)

        await urlSessionMock.dataMockFunc.willReturn((Data(), failureResponse))

        await #expect(throws: HttpError.errorStatusCode(statusCode: failureResponse.statusCode)) {
            _ = try await httpClient.execute(httpRequest: httpRequest)
        }
    }
}
