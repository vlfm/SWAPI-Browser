import Foundation

extension URLRequest {
    init(httpRequest: HttpRequest) {
        self.init(url: httpRequest.url)
        self.httpMethod = httpRequest.method.rawValue
    }
}
