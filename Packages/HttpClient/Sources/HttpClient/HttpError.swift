public enum HttpError: Error, Equatable {
    case errorStatusCode(statusCode: Int)
    case missingStatusCode
}
