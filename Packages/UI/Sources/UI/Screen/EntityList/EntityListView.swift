import Dependency
import SwiftUI

struct EntityListView<Entity: EntityModel>: View {
    @State var viewModel: EntityListViewModel<Entity>

    private let container: DependencyContainer

    init(container: DependencyContainer, entityType: Entity.Type) {
        self.container = container
        self._viewModel = State(
            wrappedValue: EntityListViewModel(
                entityType: entityType,
                interactor: container.interactor
            )
        )
    }

    var body: some View {
        ZStack {
            switch viewModel.content {
            case .blank:
                EmptyView()
            case .empty(let text):
                Text(text)
            case .error(let errorState):
                ErrorView(
                    errorState: errorState,
                    retryAction: { viewModel.loadData() }
                )
            case .loaded(let entities):
                List(entities) { entity in
                    NavigationLink {
                        EntityView(container: container, entity: entity)
                    } label: {
                        Text(entity.title)
                    }
                }
            case .loading:
                ProgressView()
            }
        }
        .navigationTitle(viewModel.title)
        .onAppear {
            viewModel.loadData()
        }
    }
}
