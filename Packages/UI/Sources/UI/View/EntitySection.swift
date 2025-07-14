import Domain

enum EntitySection: Hashable {
    struct ItemSection: Hashable {
        let items: [Item]
    }

    case films([Film.ID])
    case items(ItemSection)
    case people([Person.ID])
    case planets([Planet.ID])
    case species([Species.ID])
    case starships([Starship.ID])
    case vehicles([Vehicle.ID])
}

extension EntitySection {
    struct PropertyItem: Hashable {
        let name: String
        let value: String
    }

    enum Item: Hashable {
        case homeworld(Planet.ID?)
        case propertyItem(PropertyItem)
    }
}
