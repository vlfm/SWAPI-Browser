import Domain
import Interactor

extension Planet: EntityModel {
    static var pluralTitle: String { "Planets" }

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
                            name: "Population", value: population
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Diameter", value: diameter
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Gravity", value: gravity
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Orbital period", value: orbitalPeriod
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Rotation period", value: rotationPeriod
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Climate", value: climate
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Surface water", value: surfaceWater
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Terrain", value: terrain
                        )
                    )
                ]
            )
        ),
        .films(films),
        .people(residents)
    ]}

    var title: String { name }

    static func load(interactor: Interactor, source: Source) async throws -> [Self] {
        return try await interactor.planets(source: source)
    }

    static func load(id: ID, interactor: Interactor) async throws -> Self {
        return try await interactor.planet(id: id)
    }
}
