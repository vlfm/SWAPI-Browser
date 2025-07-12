public struct Id<Entity, IdValue> {
    public let value: IdValue

    public init(_ value: IdValue) {
        self.value = value
    }
}

extension Id: Equatable where IdValue: Equatable {}
extension Id: Hashable where IdValue: Hashable {}
extension Id: Sendable where IdValue: Sendable {}
