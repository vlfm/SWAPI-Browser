import Domain
import Foundation

public protocol RepositoryEntity: Identifiable where ID == Id<Self, URL> {
}

extension Film: RepositoryEntity {}
extension Person: RepositoryEntity {}
extension Planet: RepositoryEntity {}
extension Species: RepositoryEntity {}
extension Starship: RepositoryEntity {}
extension Vehicle: RepositoryEntity {}
