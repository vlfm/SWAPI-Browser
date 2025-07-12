import Foundation

protocol ApiEntity {
    associatedtype Dto: Decodable
    init(dto: Dto) throws
}

extension ApiEntity {
    init(data: Data) throws {
        let dto = try JSONDecoder().decode(Dto.self, from: data)
        try self.init(dto: dto)
    }
}
