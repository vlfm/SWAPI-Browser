import Dependency
import Domain
import SwiftUI

public struct MainView: View {
    @State var viewModel = MainViewModel()

    private let container: DependencyContainer

    public init(container: DependencyContainer) {
        self.container = container
    }

    public var body: some View {
        NavigationStack {
            List(viewModel.entityTypes, id: \.self) { entityType in
                NavigationLink {
                    switch entityType {
                    case .film:
                        EntityListView(container: container, entityType: Film.self)
                    case .person:
                        EntityListView(container: container, entityType: Person.self)
                    case .planet:
                        EntityListView(container: container, entityType: Planet.self)
                    case .species:
                        EntityListView(container: container, entityType: Species.self)
                    case .starship:
                        EntityListView(container: container, entityType: Starship.self)
                    case .vehicle:
                        EntityListView(container: container, entityType: Vehicle.self)
                    }
                } label: {
                    Text(viewModel.title(for: entityType))
                }
            }
            .navigationTitle(viewModel.title)
        }
    }
}
