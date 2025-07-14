import Domain
import Interactor

extension Film: EntityModel {
    static var pluralTitle: String { "Films" }

    var sections: [EntitySection] {[
        .items(
            EntitySection.ItemSection(
                items: [
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Title", value: title
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Episode Id", value: "\(episodeId)"
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Release Date", value: releaseDate
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Director", value: director
                        )
                    ),
                    .propertyItem(
                        EntitySection.PropertyItem(
                            name: "Producer", value: producer
                        )
                    )
                ]
            )
        ),
        .people(characters),
        .planets(planets),
        .species(species),
        .starships(starships),
        .vehicles(vehicles)
    ]}

    static func load(interactor: Interactor, source: Source) async throws -> [Self] {
        return try await interactor.films(source: source)
    }

    static func load(id: ID, interactor: Interactor) async throws -> Self {
        return try await interactor.film(id: id)
    }
}
