import Domain
import Interactor

extension Species: EntityModel {
    static var pluralTitle: String { "Species" }

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
                            name: "Classification", value: classification
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Designation", value: designation
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Language", value: language
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
                            name: "Average height", value: averageHeight
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Average lifespan", value: averageLifespan
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
                            name: "Eye colors", value: eyeColors
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Hair colors", value: hairColors
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Skin colors", value: skinColors
                        )
                    )
                ]
            )
        ),
        .films(films),
        .people(people)
    ]}

    var title: String { name }

    static func load(interactor: Interactor, source: Source) async throws -> [Self] {
        return try await interactor.species(source: source)
    }

    static func load(id: ID, interactor: Interactor) async throws -> Self {
        return try await interactor.species(id: id)
    }
}
