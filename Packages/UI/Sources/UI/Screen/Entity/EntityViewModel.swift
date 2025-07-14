import Observation

@MainActor
@Observable
final class EntityViewModel<Entity: EntityModel> {
    let entity: Entity

    var sections: [EntitySection] { entity.sections }
    var title: String { entity.title }

    init(entity: Entity) {
        self.entity = entity
    }
}
