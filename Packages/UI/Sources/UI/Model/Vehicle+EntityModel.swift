import Domain
import Interactor

extension Vehicle: EntityModel {
    static var pluralTitle: String { "Vehicles" }

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
                            name: "Class", value: vehicleClass
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
        return try await interactor.vehicles(source: source)
    }

    static func load(id: ID, interactor: Interactor) async throws -> Self {
        return try await interactor.vehicle(id: id)
    }
}
