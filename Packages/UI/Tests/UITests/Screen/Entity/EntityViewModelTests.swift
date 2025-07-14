import Domain
import DomainMock
import Foundation
import Testing

@testable import UI

struct EntityViewModelTests {
    // MARK: film

    // MARK: person

    // MARK: planet

    @Test
    func sections_planetEntity() async {
        let planet = planets[0]
        let sut = await EntityViewModel(entity: planet)
        let sections = await sut.sections

        #expect(
            sections == [
                .items(
                    EntitySection.ItemSection(
                        items: [
                            .propertyItem(
                                EntitySection.PropertyItem(
                                    name: "Name", value: "Tatooine"
                                )
                            ),
                            .propertyItem(
                                EntitySection.PropertyItem(
                                    name: "Population", value: "200000"
                                )
                            ),
                            .propertyItem(
                                EntitySection.PropertyItem(
                                    name: "Diameter", value: "10465"
                                )
                            ),
                            .propertyItem(
                                EntitySection.PropertyItem(
                                    name: "Gravity", value: "1 standard"
                                )
                            ),
                            .propertyItem(
                                EntitySection.PropertyItem(
                                    name: "Orbital period", value: "304"
                                )
                            ),
                            .propertyItem(
                                EntitySection.PropertyItem(
                                    name: "Rotation period", value: "23"
                                )
                            ),
                            .propertyItem(
                                EntitySection.PropertyItem(
                                    name: "Climate", value: "arid"
                                )
                            ),
                            .propertyItem(
                                EntitySection.PropertyItem(
                                    name: "Surface water", value: "1"
                                )
                            ),
                            .propertyItem(
                                EntitySection.PropertyItem(
                                    name: "Terrain", value: "desert"
                                )
                            )
                        ]
                    )
                ),
                .films([
                    Film.ID(URL(string: "https://swapi.info/api/films/1")!)
                ]),
                .people([
                    Person.ID(URL(string: "https://swapi.info/api/people/1")!)
                ])
            ]
        )
    }

    // MARK: species

    // MARK: starship

    // MARK: vehicle
}
