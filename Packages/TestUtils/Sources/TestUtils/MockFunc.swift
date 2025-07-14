public final class MockFunc<Input, Output, Error: Swift.Error> {
    public private(set) var inputs: [Input] = []

    private var output: (Input) throws -> Output? = { _ in nil }

    public init() {
    }

    public func call(_ input: Input) throws(Error) -> Output {
        inputs.append(input)

        do {
            return try output(input)!
        } catch {
            throw error as! Error
        }
    }

    public func willReturn(_ output: @escaping (Input) throws(Error) -> Output?) {
        self.output = output
    }

    public func willReturn(_ output: Output) {
        self.output = { _ in output }
    }

    public func willThrow(_ error: Error) {
        self.output = { _ in throw error }
    }
}

public extension MockFunc {
    var callCount: Int {
        inputs.count
    }

    var lastInput: Input? {
        inputs.last
    }
}

public extension MockFunc where Input == Void {
    func call() throws(Error) -> Output {
        return try call(())
    }
}

public extension MockFunc where Output == Void {
    func willReturn() {
        self.output = { _ in () }
    }
}
