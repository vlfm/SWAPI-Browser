import Domain
import Interactor

extension Person: EntityModel {
    static var pluralTitle: String { "People" }

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
                            name: "Gender", value: gender
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Birth Year", value: birthYear
                        )
                    ),
                    .homeworld(homeworld)
                ]
            )
        ),
        .items(
            EntitySection.ItemSection(
                items: [
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Eye color", value: eyeColor
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Hair color", value: hairColor
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Skin color", value: skinColor
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
                            name: "Mass", value: mass
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Height", value: height
                        )
                    )
                ]
            )
        ),
        .films(films),
        .species(species),
        .starships(starships),
        .vehicles(vehicles)
    ]}

    var title: String { name }

    static func load(interactor: Interactor, source: Source) async throws -> [Self] {
        return try await interactor.people(source: source)
    }

    static func load(id: ID, interactor: Interactor) async throws -> Self {
        return try await interactor.person(id: id)
    }
}
