import Domain

@MainActor
final class MainViewModel {
    enum EntityType: CaseIterable {
        case film
        case person
        case planet
        case species
        case starship
        case vehicle
    }

    let entityTypes = EntityType.allCases
    let title = "Star Wars"

    func title(for entityType: EntityType) -> String {
        switch entityType {
        case .film:
            return Film.pluralTitle
        case .person:
            return Person.pluralTitle
        case .planet:
            return Planet.pluralTitle
        case .species:
            return Species.pluralTitle
        case .starship:
            return Starship.pluralTitle
        case .vehicle:
            return Vehicle.pluralTitle
        }
    }
}
