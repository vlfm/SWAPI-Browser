import Dependency
import Domain
import SwiftUI

struct EntityView<Entity: EntityModel>: View {
    @State var viewModel: EntityViewModel<Entity>

    private let container: DependencyContainer

    init(container: DependencyContainer, entity: Entity) {
        self.container = container
        self._viewModel = State(
            wrappedValue: EntityViewModel(
                entity: entity
            )
        )
    }

    var body: some View {
        List(viewModel.sections, id: \.self) { section in
            switch section {
            case .films(let ids):
                RelatedEntitySectionView<Film>(container: container, ids: ids)
            case .items(let section):
                Section {
                    ForEach(section.items, id: \.self) { item in
                        switch item {
                        case .propertyItem(let item):
                            HStack {
                                Text(item.name)
                                    .fontWeight(.bold)
                                Spacer()
                                Text(item.value)
                            }
                        case .homeworld(let planetId):
                            HomeworldView(container: container, id: planetId)
                        }
                    }
                }
            case .people(let ids):
                RelatedEntitySectionView<Person>(container: container, ids: ids)
            case .planets(let ids):
                RelatedEntitySectionView<Planet>(container: container, ids: ids)
            case .species(let ids):
                RelatedEntitySectionView<Species>(container: container, ids: ids)
            case .starships(let ids):
                RelatedEntitySectionView<Starship>(container: container, ids: ids)
            case .vehicles(let ids):
                RelatedEntitySectionView<Vehicle>(container: container, ids: ids)
            }
        }
        .navigationTitle(viewModel.title)
    }
}
