import Dependency
import SwiftUI

struct RelatedEntitySectionView<Entity: EntityModel>: View {
    @State var viewModel: RelatedEntitySectionViewModel<Entity>

    private let container: DependencyContainer

    init(container: DependencyContainer, ids: [Entity.ID]) {
        self.container = container
        self._viewModel = State(
            wrappedValue: RelatedEntitySectionViewModel(
                ids: ids,
                interactor: container.interactor
            )
        )
    }

    var body: some View {
        Section {
            switch viewModel.content {
            case .blank:
                Color.clear
                    .onAppear {
                        viewModel.loadData()
                    }
            case .empty(let text):
                Text(text)
            case .error(let errorState):
                ErrorView(
                    errorState: errorState,
                    retryAction: { viewModel.loadData() }
                )
            case .loaded(let entities):
                ForEach(entities) { entity in
                    NavigationLink {
                        EntityView(container: container, entity: entity)
                    } label: {
                        Text(entity.title)
                    }
                }
            case .loading:
                ProgressView()
            }
        } header: {
            Text(viewModel.title)
        }
    }
}
