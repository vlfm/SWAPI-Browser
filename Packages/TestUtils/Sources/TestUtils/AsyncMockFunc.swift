public actor AsyncMockFunc<Input, Output, Error: Swift.Error> {
    public private(set) var inputs: [Input] = []

    private var mockFunc = MockFunc<Input, Output, Error>()

    public init() {
    }

    public func call(_ input: Input) throws(Error) -> Output {
        return try mockFunc.call(input)
    }

    public func willReturn(_ output: Output) {
        mockFunc.willReturn(output)
    }

    public func willThrow(_ error: Error) {
        mockFunc.willThrow(error)
    }
}

public extension AsyncMockFunc {
    var callCount: Int {
        mockFunc.callCount
    }

    var lastInput: Input? {
        mockFunc.lastInput
    }
}

public extension AsyncMockFunc where Input == Void {
    func call() throws(Error) -> Output {
        return try mockFunc.call()
    }
}

public extension AsyncMockFunc where Output == Void {
    func willReturn() {
        mockFunc.willReturn()
    }
}

