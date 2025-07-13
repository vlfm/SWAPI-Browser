import Interactor

@MainActor
public protocol DependencyContainer {
    var interactor: Interactor { get }
}
