import Interactor
import Observation

@MainActor
@Observable
final class RelatedEntitySectionViewModel<Entity: EntityModel> {
    var content: DataContent<[Entity]> {
        dataLoader.content
    }

    var title: String { Entity.pluralTitle }

    private let dataLoader: DataLoader<[Entity]>

    init(ids: [Entity.ID], interactor: Interactor) {
        self.dataLoader = DataLoader(
            loadOperations: [{
                return try await withThrowingTaskGroup(of: Entity.self) { group in
                    for id in ids {
                        group.addTask {
                            return try await Entity.load(id: id, interactor: interactor)
                        }
                    }

                    var result: [Entity] = []

                    for try await entity in group {
                        result.append(entity)
                    }

                    return result
                }
            }],
            mapValue: { entities in
                if entities.isEmpty {
                    return .empty("No \(Entity.pluralTitle) found")
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
