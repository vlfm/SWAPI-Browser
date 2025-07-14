import Domain
import Interactor
import Observation

@MainActor
@Observable
final class HomeworldViewModel {
    var content: DataContent<Planet?> {
        dataLoader.content
    }

    private let dataLoader: DataLoader<Planet?>

    init(id: Planet.ID?, interactor: Interactor) {
        self.dataLoader = DataLoader(
            loadOperations: [{
                if let id  {
                    return try await interactor.planet(id: id)
                } else {
                    return nil
                }
            }],
            mapValue: { planet in
                if let planet {
                    return .loaded(planet)
                } else {
                    return .empty("n/a")
                }
            }
        )
    }

    func loadData() {
        dataLoader.loadData()
    }
}
