import Observation

@Observable
@MainActor
final class DataLoader<Value: Sendable> {
    typealias LoadOperation = () async throws -> Value

    private(set) var content: DataContent<Value> = .blank

    private(set) var state: DataState<Value> = .idle {
        didSet {
            content.updated(with: state, mapContent: mapValue)
        }
    }

    private let loadOperations: [LoadOperation]
    private let mapValue: (Value) -> DataContent<Value>

    init(
        loadOperations: [LoadOperation],
        mapValue: @escaping (Value) -> DataContent<Value>
    ) {
        self.loadOperations = loadOperations
        self.mapValue = mapValue
    }

    func loadData() {
        Task {
            await loadDataAsync()
        }
    }

    private func loadData(loadOperation: LoadOperation) async {
        switch state {
        case .failed, .idle, .loaded:
            state = .loading
            do {
                let value = try await loadOperation()
                self.state = .loaded(value)
            } catch {
                self.state = .failed(error)
            }
        case .loading:
            break
        }
    }
}

@_spi(testable)
extension DataLoader {
    func loadDataAsync() async {
        for loadOperation in loadOperations {
            await loadData(loadOperation: loadOperation)
        }
    }
}
