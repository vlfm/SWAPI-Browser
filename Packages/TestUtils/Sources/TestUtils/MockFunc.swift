public final class MockFunc<Input, Output, Error: Swift.Error> {
    public private(set) var inputs: [Input] = []

    private var error: Error?
    private var output: Output?

    public init() {
    }

    public func call(_ input: Input) throws(Error) -> Output {
        inputs.append(input)

        if let error = error {
            throw error
        }

        return output!
    }

    public func willReturn(_ output: Output) {
        self.error = nil
        self.output = output
    }

    public func willThrow(_ error: Error) {
        self.error = error
        self.output = nil
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
        self.error = nil
        self.output = ()
    }
}
