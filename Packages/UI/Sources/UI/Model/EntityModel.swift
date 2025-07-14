import Interactor

protocol EntityModel: Identifiable, Sendable where ID: Sendable {
    static var pluralTitle: String { get }

    var sections: [EntitySection] { get }
    var title: String { get }

    static func load(interactor: Interactor, source: Source) async throws -> [Self]
    static func load(id: ID, interactor: Interactor) async throws -> Self
}
