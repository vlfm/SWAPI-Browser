import ApiService
import Foundation
import HttpClient
import Interactor
import Repository

public func makeDependencyContainer() -> DependencyContainer {
    return DependencyContainerImpl()
}

private final class DependencyContainerImpl: DependencyContainer {
    lazy var interactor = makeInteractor(
        apiService: makeApiService(
            httpClient: makeHttpClient(
                urlSession: URLSession.shared
            )
        ),
        repository: makeRepository()
    )
}
