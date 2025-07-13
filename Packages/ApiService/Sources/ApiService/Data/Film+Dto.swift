import Domain
import Foundation

extension Film: ApiEntity {
    init(dto: FilmDto) {
        self.init(
            characters: dto.characters.map { Person.ID($0) },
            director: dto.director,
            episodeId: dto.episode_id,
            id: ID(dto.url),
            openingCrawl: dto.opening_crawl,
            planets: dto.planets.map { Planet.ID($0) },
            producer: dto.producer,
            releaseDate: dto.release_date,
            species: dto.species.map { Species.ID($0) },
            starships: dto.starships.map { Starship.ID($0) },
            title: dto.title,
            vehicles: dto.vehicles.map { Vehicle.ID($0) }
        )
    }
}

struct FilmDto: Codable {
    let characters: [URL]
    let director: String
    let episode_id: Int
    let opening_crawl: String
    let planets: [URL]
    let producer: String
    let release_date: String
    let species: [URL]
    let starships: [URL]
    let title: String
    let url: URL
    let vehicles: [URL]
}
