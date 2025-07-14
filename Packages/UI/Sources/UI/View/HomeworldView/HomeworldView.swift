import Dependency
import Domain
import SwiftUI

struct HomeworldView: View {
    @State var viewModel: HomeworldViewModel

    let container: DependencyContainer

    init(container: DependencyContainer, id: Planet.ID?) {
        self.container = container
        self._viewModel = State(
            wrappedValue: HomeworldViewModel(
                id: id,
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
                row {
                    Text(text)
                }
            case .error(let errorState):
                ErrorView(
                    errorState: errorState,
                    retryAction: { viewModel.loadData() }
                )
            case .loaded(let planet):
                if let planet {
                    NavigationLink {
                        EntityView(container: container, entity: planet)
                    } label: {
                        row {
                            Text(planet.name)
                        }
                    }
                } else {
                    EmptyView()
                }
            case .loading:
                row {
                    ProgressView()
                }
            }
        }
        .onAppear {
            viewModel.loadData()
        }
    }

    private func row<V: View>(trailingView: () -> V) -> some View {
        HStack {
            Text("Homeworld")
                .fontWeight(.bold)
            Spacer()
            trailingView()
        }
    }
}
