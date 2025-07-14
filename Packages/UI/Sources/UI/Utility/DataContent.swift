enum DataContent<Content> {
    case blank
    case empty(String)
    case error(ErrorState)
    case loading
    case loaded(Content)
}

extension DataContent: Equatable where Content: Equatable {}
extension DataContent: Sendable where Content: Sendable {}

extension DataContent {
    mutating func updated(
        with state: DataState<Content>,
        mapContent: (Content) -> DataContent<Content>
    ) {
        switch state {
        case .failed(let error):
            switch self {
            case .blank, .empty, .error, .loading:
                self = .error(ErrorState(error: error))
            case .loaded:
                break
            }
        case .idle:
            break
        case .loaded(let content):
            self = mapContent(content)
        case .loading:
            switch self {
            case .blank, .empty, .error:
                self = .loading
            case .loaded, .loading:
                break
            }
        }
    }
}
