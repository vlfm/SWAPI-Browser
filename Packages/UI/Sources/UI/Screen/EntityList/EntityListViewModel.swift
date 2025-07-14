import Interactor
import Observation

@Observable
@MainActor
final class EntityListViewModel<Entity: EntityModel> {
    let entityType: Entity.Type

    var content: DataContent<[Entity]> {
        dataLoader.content
    }

    var title: String { entityType.pluralTitle }

    private let dataLoader: DataLoader<[Entity]>

    init(entityType: Entity.Type, interactor: Interactor) {
        self.entityType = entityType
        self.dataLoader = DataLoader(
            loadOperations: [
                { try await entityType.load(interactor: interactor, source: .cache) },
                { try await entityType.load(interactor: interactor, source: .api) }
            ],
            mapValue: { entities in
                if entities.isEmpty {
                    return .empty("No \(entityType.pluralTitle) found")
                } else {
                    return .loaded(entities)
                }
            }
        )
    }

    func loadData() {
        dataLoader.loadData()
    }
}

@_spi(testable)
extension EntityListViewModel {
    func loadDataAsync() async {
        await dataLoader.loadDataAsync()
    }
}
