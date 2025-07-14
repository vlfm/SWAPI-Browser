import Domain
import Interactor

extension Starship: EntityModel {
    static var pluralTitle: String { "Starships" }

    var sections: [EntitySection] {[
        .items(
            EntitySection.ItemSection(
                items: [
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Name", value: name
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Model", value: model
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Class", value: starshipClass
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Manufacturer", value: manufacturer
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Cost in credits", value: costInCredits
                        )
                    )
                ]
            )
        ),
        .items(
            EntitySection.ItemSection(
                items: [
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Length", value: length
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Max atmosphering speed", value: maxAtmospheringSpeed
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Max number of megalights", value: maxNumberOfMegalights
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Hyperdrive rating", value: hyperdriveRating
                        )
                    )
                ]
            )
        ),
        .items(
            EntitySection.ItemSection(
                items: [
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Cargo capacity", value: cargoCapacity
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Consumables", value: consumables
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Crew", value: crew
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Passengers", value: passengers
                        )
                    )
                ]
            )
        ),
        .films(films),
        .people(pilots)
    ]}

    var title: String { name }

    static func load(interactor: Interactor, source: Source) async throws -> [Self] {
        return try await interactor.starships(source: source)
    }

    static func load(id: ID, interactor: Interactor) async throws -> Self {
        return try await interactor.starship(id: id)
    }
}
